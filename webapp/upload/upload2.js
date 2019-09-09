String.prototype.startWith=function(str){
		  var reg=new RegExp("^"+str);
		  return reg.test(this);
		}
	
String.prototype.endWith=function(str){
		  var reg=new RegExp(str+"$");
		  return reg.test(this);
		}
		function GetRequest() {
		   var url = location.search; //获取url中"?"符后的字串
		   var theRequest = new Object();
		   if (url.indexOf("?") != -1) {
		      var str = url.substr(1);
		      strs = str.split("&");
		      for(var i = 0; i < strs.length; i ++) {
		         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
		      }
		   }
		   return theRequest;
		}
var request = new Object();
    request = GetRequest();
//alert(window.location);
/**
   参数列表
   multi：true 多文件上传
   uploadLimit：最大文件上传数量
   fileSizeLimit："3MB"文件大小限制 0：无限制
   fileTypeDesc："*.jpg;*.jpge;*.gif;*.png"文件格式限制,
   isview:true,只是查看

**/
	$(function() {
	//去掉删除功能
	   if(request.isview){ $("#delete").remove();}
	
	
	    var icp=ctx+"/static/fileupload/images/icons/32/";
	    var iconpath={".doc"	:icp+"doc.gif",
	                  ".ai"		:icp+"doc.gif",
	                  ".avi"	:icp+"ai.gif",
	                  ".vmp"	:icp+"vmp.gif",
	                  ".cs"		:icp+"cs.gif",
	                  ".dll"	:icp+"dll.gif",
	                  ".docx"	:icp+"docx.gif",
	                  ".exe"	:icp+"exe.gif",
	                  ".docx"	:icp+"docx.gif",
	                  ".fla"	:icp+"fla.gif",
	                  ".gif"	:icp+"gif.gif",
	                  ".jpg"	:icp+"jpg.gif",
	                  ".png"	:icp+"png.gif",
	                  ".js"		:icp+"js.gif",
	                  ".mdb"	:icp+"mdb.gif",
	                  ".mp3"	:icp+"mp3.gif",
	                  ".pdf"	:icp+"pdf.gif",
	                  ".ppt"	:icp+"ppt.gif",
	                  ".pptx"	:icp+"pptx.gif",
	                  ".swf"	:icp+"swf.gif",
	                  ".swt"	:icp+"swt.gif",
	                  ".txt"	:icp+"txt.gif",
	                  ".pptx"	:icp+"pptx.gif",
	                  ".vsd"	:icp+"vsd.gif",
	                  ".xls"	:icp+"xls.gif",
	                  ".xml"	:icp+"xml.gif",
	                  ".zip"	:icp+"zip.gif",
	                  ".xlsx"	:icp+"xlsx.gif",
	                  ".sql"	:icp+"sql.gif",  
	                  ""	:icp+"default.icon.gif"  
	                  };
	   

 	 
    function addUpload(){
    	
	     var multi=true;
	     if(request["multi"]=="false")
	         multi=false;
	     if(request["uploadLimit"]){
	         uploadLimit=request["uploadLimit"];
	      }
	     if(request.isview){
	     
	     }
	     else 
	     $("#uploadify").uploadify({
		  /*开启调试
	       // 'debug' : true,
	       //是否自动上传
	      // 'auto':false,
	       //超时时间
	       //'successTimeout':99999,
	       //'button_image_url':"/",
	      //  button_image_url:"../static/img/logo.jpg",
	       
	       // uploadLimit   :uploadLimit,//request["uploadLimit"]?((request["uploadLimit"]-len)==0?-1:(request["uploadLimit"]-len)):0,
	       */  
	        multi		  :multi,
	        fileSizeLimit :request["fileSizeLimit"]?request["fileSizeLimit"]:"5MB",
	        fileTypeExts  :request["fileTypeExts"]?request["fileTypeExts"]:"*.*", 
            height        : 30,
	        swf           : ctx+'/static/fileupload/uploadify.swf',
	        uploader      : ctx+'/upload.file',
	        width         : 120,
	        'method' : 'get', 
	        buttonImg:"../static/img/logo.jpg",
	        buttonText    :"选择文件",
	        'formData'    :{'businessId': ""+request["businessId"],'field01': ""+(request["field01"]?request["field01"]:""),'fileType': ""+request["fileType"],'fileName':""+(request["fileName"]?request["fileName"]:""),'fullpath':""+(request["fullpath"]?request["fullpath"]:"") },//检测FLASH失败调用
			onFallback :function(){
				var f= confirm("您未安装FLASH控件，无法上传图片！确定安装吗？");
				if(f)window.open("http://get.adobe.com/cn/flashplayer/");
			},
			//上传到服务器，服务器返回相应信息到data里
			onUploadSuccess:function(file, data, response){
			    loadFiles();
            	//bindSelected();
			},
			//overrideEvents : ['onSelect'],
			onSelectError:function(){ 
			   return true;
			}
		
      
	    });
	    
	    }
	  
		function loadFiles( ){
			       $.ajax({
			         url:ctx+"/upload/getFileList?businessId="+request["businessId"]+"&fullpath="+(request["fullpath"]?request["fullpath"]:"")+"&fileType="+(request["fileType"]?request["fileType"]:"")+"&field01="+(request["field01"]?request["field01"]:""),
			         cache:false,
			         method:"get",
	                 dataType:"json", 
			         success:function(d){ 
			             showFiles(d);
			                var iframe=window.parent.document.getElementById(request["iframeId"]);
					        if(iframe){
					           iframe.setAttribute("fileCount",d.length);
					        }  
			             curFileList=d;
			            
			         },
			         beforeSend:function(){
	                    $("#files_div").append("<img src='"+ctx+"/static/fileupload/images/loaders/32x32.gif'>");
	                 }
			       });
		} 
		
		function getPath(fname) {
			var contentPath = request["businessId"];
		    if (request["fileType"])
		    	contentPath = contentPath + "/" + request["fileType"];
		    if (request["field01"])
		    	contentPath = contentPath + "/" + request["field01"];
	    	contentPath = contentPath + "/" + fname;
	    	return encodeURIComponent(contentPath);
		}
		function showFiles(files){
		   $("#files_div").html("");
		  
		   if(files.length==0){
		      $("#files_div").html("尚未上传任何文件");
		      return ;
		   }
		   if(request["showtype"]=="1"){
		       
		   
		   
		      // return ;
		   }
		   for(var i=0;i<files.length;i++){
		       var  file=files[i];
			  // if(file.type && file.type!='' && file.type.indexOf(".")!=-1){ 
				       var path= iconpath[file.type];
				       if(!path)path=icp+"default.icon.gif";
				       path=ctx+"/static-content?contentPath="+getPath(file.name)+"&t="+new Date().getTime();
				       //  <a href="#" class="thumbnail">
				       var str= "<a fname='"+file.name+"' class='file_entry'><div class='image'><div class='img' style=''><img src='"+path+"' width=100 height=100 style='padding-bottom:5px;'/></div></div>";
				       if (file.name.indexOf(".pdf") >= 0)
				    	   str ="<a fname='"+file.name+"' class='file_entry' href='"+path+"&pdf=true' target='_Blank' style='width:auto'>"+file.name;
				       if(request["showtype"]=="1")
				           str= "<a fname='"+file.name+"' class='file_entry' style='border:0px;'></div>";
				       if(request["imgView"]=="true")
				       	 {
				       		//path=ctx+"/static-content?contentPath="+request["module"]+"/"+file.name+"&tt="+new Date().getTime();
				      	     //str= "<a fname='"+file.name+"' class='file_entry thumbnails'><div class='image' style='width:100px;'><div class='img thumbnail'><img src='"+path+"'/></div></div>";
				       
				      	 }
				        var pstr= str;//+"<h5 style='text-align:left;'  id='r1_label' title='"+file.name+"'>"+file.name+"</h5>";
				      	   // pstr=pstr +"<span role='list presentation' class='details' id='r1_details'>";
				      	    //if(request["showtype"]=="1"){
				      	   // }
				      	    //pstr=pstr +"<span aria-label='Size'>"+Math.round(file.size/1024)+" KB</span></span>";
				      	    pstr=pstr +"</a>";
				      	  if(request["showtype"]=="1"){
				      	  	   pstr= str+"<h5 style='text-align:left;'  id='r1_label' title='"+file.name+"'>"+file.name+"</h5>";
					      	    pstr=pstr +"<span role='list presentation' class='details' style='position: relative' id='r1_details'>";
					      	   pstr=pstr +"<img style='position: absolute;top:-14px;left:60px;' src='"+ctx+"/static/img/delete.png'></span></a>";
				      	  
				      	    }
				      //alert(pstr);
				       jQuery("#files_div").append(pstr);
				    //}else  
				      // jQuery("#files_div").append("<img src='"+icp+"default.icon.gif'>");
		   }
		     //右键菜单  
		     if(request["showtype"]=="1")return ;
		     $('a.file_entry').contextMenu('myMenu1', 
		          {
		          bindings: 
		          {
		            'view': function(t,target) {
		                var fname=jQuery("a.selected").attr("fname");
					    if(fname.endWith(".gif") || fname.endWith(".png") ||fname.endWith(".jpg")||fname.endWith(".jpeg")||fname.endWith(".bmp"))
					    { 
					       var path=ctx+"/static-content?contentPath="+getPath(fname)+"&fullpath="+(request["fullpath"]?request["fullpath"]:"");
					       $.dialog({
							    id: 'a15',
							    title: fname,
							    lock: true,
							    content: "<div style='width:500px;height:500px;overflow:auto;'><img src=\""+path+"\"  style=\"padding:10px;\" /></div>",
							    padding: 10,
							    zIndex:9999999,
							    height:300,
							    width:500,
							    top:0 
							});
					       
					       //jQuery("#viewImg").attr("src",path).click();
					    }else if (fname.endWith(".pdf")) {
					    	//打开pdf文件
					    	window.open(jQuery("a.selected").attr("href"));

					    } else {
					       //ignore
					       // jQuery("div#jqContextMenu").find("li:first") ;
					    }
		            },
		            'down': function(t,target) {
		                  var fname=jQuery("a.selected").attr("fname");
		                  downFile(fname,request["businessId"]); 
		                  
		            },
		            'delete': function(t,target) {
		                 var fname=jQuery("a.selected").attr("fname");
		                 deleteFile(fname,request["businessId"]);
		                 
		            
		              //alert('Trigger was '+t.id+'\nAction was Delete');
		            },
		            'optionImg': function(t,target) {
		                 var fname=jQuery("a.selected").attr("fname");
		                 //deleteFile(fname,request["module"]);
		                 parent.setOptionImg(fname);
		            
		              //alert('Trigger was '+t.id+'\nAction was Delete');
		            }
		          } 
			 });
			 //单击事件
			 jQuery("a.file_entry").unbind("click").click(function(){
	             jQuery("a.selected").removeClass("selected");
			     jQuery(this).addClass("selected");
	        });
			 $('a.test').media({width:800, height:600});  
		} 
		
		
		function deleteFile(fname,businessId){
		      var f=confirm("确定删除吗？");  
		      if(f){
		       $.ajax({
			         url:ctx+"/upload/deleteFile",
			         cache:false,
			         method:"POST",
	                 dataType:"json", 
	                 data:{fname:fname,businessId:request["businessId"],fullpath:(request["fullpath"]?request["fullpath"]:""),fileType:(request["fileType"]?request["fileType"]:""),field01:(request["field01"]?request["field01"]:"")},
			         success:function(d){
			          loadFiles();
			         }
			          
			       });
		      }
		} 
	    
	    function downFile(fname,businessId){
	        var path=ctx+"/static-content?download=true&contentPath="+getPath(fname)+"&fullpath="+(request["fullpath"]?request["fullpath"]:"")+"&fileType="+(request["fileType"]?request["fileType"]:"")+"&field01="+(request["field01"]?request["field01"]:"");

	        window.location.href=path;
	    } 
	    
	    //	
	   // $("img#viewImg").fancyZoom({scaleImg: true, closeOnClick: true});
	    
	       
	    if(request["adap"]=="true"){//是否需要高度自适应
	        if(!request["iframeId"]){
	           alert("iframe ID为必须的，当需要自适应时");return ;
	        }
	        var iframe=window.parent.document.getElementById(request["iframeId"]);
	        if(!iframe){
	           alert("iframe ["+request["iframeId"]+"]不存在");return ;
	        }  
	        window.setInterval(function(){
	              var winHeight = jQuery(window).height();
	   			  var winWidth = jQuery(window).width(); 
	   			  var winh= jQuery("#wrapper_"+request["iframeId"]).height();
	   			  jQuery(window.parent.document.getElementById(request["iframeId"])).height(winh+20);
	   			 // $("#timer").html(scroll);
	        }, 200);
        } 
        //加载已有文件
		loadFiles();
		addUpload();
		 
	});
//上传文件数量限制
var curFileList=[]; 
var uploadLimit=0;