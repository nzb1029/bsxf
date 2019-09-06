<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<script src="${ctx }/static/highcharts/js/highcharts.js"></script>
	<script src="${ctx }/static/highcharts/js/modules/exporting.js"></script>
	<script>
		$(document).ready(function() {
			Highcharts.setOptions({                                                     
	            global: {                                                               
	                useUTC: false                                                       
	            }                                 
	        });
			init();
		});

		function init(){
			$.ajax({
				url:ctx+"/income/generateColumn",
				dataType: 'json',
				type:"POST",
				data:{},
				success:function(dList){
					 if(dList !=null && dList.length > 0){
						generateData(dList);
					 }else{
						 $('#costDunContainer').html("请联系管理员配置基础数据");
					 }
				}
			  }).fail(function(d) { alert("error " ); });

		}

		function generateData(dList){
			generateCostDunData(dList);
			generateCostData(dList);
			if(dList.length >2){
			  generateIncomeDunData(dList);
			  generateIncomeData(dList);
			}
		}
        //成本使用量 柱状图 
        function generateCostDunData(dList){
        	$('#costDunContainer').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '每公顷肥料对比图'
                },
                subtitle: {
                   text: '数据来源: 爱科农科技有限公司'
                },
                xAxis: {
		        	categories:dList[0].xAxis,                                                   
	                type:'datetime',
	                labels: {
	                  formatter: function () {
					        		return Highcharts.dateFormat('%Y-%m-%d', this.value);
	                            }
	                }
		        },
                yAxis: {
                    min: 0,
                    title: {
                        text: '使用量（吨/公顷）'
                    }
                },
                exporting: {
    				buttons:{
                    	contextButton: {
                        	menuItems: [{
	                            text: '打印',
	                            onclick: function () {
	                                this.print();
                                }
                        	},
                          {
                            text: '下载JPEG格式',
                            onclick: function () {
                                this.exportChart({
                                    type:'image/jpeg'
                                });
                            }
                        },
                              {
                                 text: '下载PDF格式',
                                 onclick: function () {
                                     this.exportChart({
                                         type:'image/pdf'
                                     });
                                 }
                              },
                               {
                                   text: '下载PNG格式',
                                   onclick: function () {
                                       this.exportChart();
                                   },separator: false
                               }]
                   		 }
               			 }
                           },
					    credits: {          
					        enabled:false,
		       				text:'爱科农科技有限公司'
					    }, 
						    
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} 吨</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series:dList[0].series
            });
         }
        //成本 支出 柱状图 
        function generateCostData(dList){
        	$('#costContainer').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '每公顷成本对比图'
                },
                subtitle: {
                    text: '数据来源: 爱科农科技有限公司'
                 },
                xAxis: {
		        	categories:dList[1].xAxis,                                                   
	                type:'datetime',
	                labels: {
	                  formatter: function () {
					        		return Highcharts.dateFormat('%Y-%m-%d', this.value);
	                            }
	                }
		        },
                yAxis: {
                    min: 0,
                    title: {
                        text: '元/公顷'
                    }
                },
                exporting: {
    				buttons:{
                    	contextButton: {
                        	menuItems: [{
	                            text: '打印',
	                            onclick: function () {
	                                this.print();
                                }
                        	},
                          {
                            text: '下载JPEG格式',
                            onclick: function () {
                                this.exportChart({
                                    type:'image/jpeg'
                                });
                            }
                        },
                              {
                                 text: '下载PDF格式',
                                 onclick: function () {
                                     this.exportChart({
                                         type:'image/pdf'
                                     });
                                 }
                              },
                               {
                                   text: '下载PNG格式',
                                   onclick: function () {
                                       this.exportChart();
                                   },separator: false
                               }]
                   		 }
               			 }
                           },
			    credits: {          
			        enabled:false,
       				text:'爱科农科技有限公司'
			    }, 
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series:dList[1].series
            });
        }
        //收益 收成量  柱状图 
        function generateIncomeDunData(dList){
        	$('#incomeDunContainer').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '每公顷产量对比图'
                },
                subtitle: {
                    text: '数据来源: 爱科农科技有限公司'
                 },
                xAxis: {
		        	categories:dList[2].xAxis,                                                   
	                type:'datetime',
	                labels: {
	                  formatter: function () {
					        		return Highcharts.dateFormat('%Y-%m-%d', this.value);
	                            }
	                }
		        },
                yAxis: {
                    min: 0,
                    title: {
                        text: '吨/公顷'
                    }
                },
                exporting: {
    				buttons:{
                    	contextButton: {
                        	menuItems: [{
	                            text: '打印',
	                            onclick: function () {
	                                this.print();
                                }
                        	},
                          {
                            text: '下载JPEG格式',
                            onclick: function () {
                                this.exportChart({
                                    type:'image/jpeg'
                                });
                            }
                        },
                              {
                                 text: '下载PDF格式',
                                 onclick: function () {
                                     this.exportChart({
                                         type:'image/pdf'
                                     });
                                 }
                              },
                               {
                                   text: '下载PNG格式',
                                   onclick: function () {
                                       this.exportChart();
                                   },separator: false
                               }]
                   		 }
               			 }
                           },
			    credits: {          
			        enabled:false,
       				text:'爱科农科技有限公司'
			    }, 
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} 吨</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series:dList[2].series
            });
        }
        //收益 柱状图 
        function generateIncomeData(dList){
        	$('#incomeContainer').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '每公顷收益对比图'
                },
                subtitle: {
                    text: '数据来源: 爱科农科技有限公司'
                 },
                xAxis: {
		        	categories:dList[3].xAxis,                                                   
	                type:'datetime',
	                labels: {
	                  formatter: function () {
					        		return Highcharts.dateFormat('%Y-%m-%d', this.value);
	                            }
	                }
		        },
                yAxis: {
                    min: 0,
                    title: {
                        text: '元/公顷'
                    }
                },
                exporting: {
    				buttons:{
                    	contextButton: {
                        	menuItems: [{
	                            text: '打印',
	                            onclick: function () {
	                                this.print();
                                }
                        	},
                          {
                            text: '下载JPEG格式',
                            onclick: function () {
                                this.exportChart({
                                    type:'image/jpeg'
                                });
                            }
                        },
                              {
                                 text: '下载PDF格式',
                                 onclick: function () {
                                     this.exportChart({
                                         type:'image/pdf'
                                     });
                                 }
                              },
                               {
                                   text: '下载PNG格式',
                                   onclick: function () {
                                       this.exportChart();
                                   },separator: false
                               }]
                   		 }
               			 }
                           },
			    credits: {          
			        enabled:false,
       				text:'爱科农科技有限公司'
			    }, 
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series:dList[3].series
            });
        }
		
	</script>
</head>
<body class="user_page" width="100%">
<div class="title">成本对比图</div>
<table width="100%">
	<tr>
		<td width="40%">
			<div id="costDunContainer" style="width:100%; height: 350px;"></div> 
		 </td>
		 <td width="40%">
		   <div id="costContainer" style="width:100%; height: 350px;"></div>	
		 	</td>
	</tr>
</table>

<div class="title">收益对比图</div>
<table width="100%">
	<tr>
		<td width="40%">
			<div id="incomeDunContainer" style="width:100%; height: 350px;"></div> 
		 </td>
		 <td width="40%">
		   <div id="incomeContainer" style="width:100%; height: 350px;"></div>	
		 	</td>
	</tr>
</table>

</body>
</html>
