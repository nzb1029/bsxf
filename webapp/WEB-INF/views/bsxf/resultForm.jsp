<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<%@page import="org.springside.mapper.JsonMapper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static-content?contentPath="/>
<html>
<head>
    <title>巡检结果提交</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${ctx}/static/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/bootstrap-dialog/css/bootstrap-dialog.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/bootstrap-fileinput/css/fileinput.min.css" type="text/css" rel="stylesheet" />

    <script src="${ctx}/static/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-dialog/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-fileinput/js/fileinput.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-fileinput/js/locales/zh.js" type="text/javascript"></script>
    <script type="application/javascript">
        $.fn.serializeJson=function(){
            var serializeObj={};
            var array=this.serializeArray(); //将form表单序列化数组对象
            var str=this.serialize();  //将form表单序列化字符串
            $(array).each(function(){  //遍历表单数组拼接json串
                if(serializeObj[this.name]){
                    if($.isArray(serializeObj[this.name])){
                        serializeObj[this.name].push(this.value);
                    }else{
                        serializeObj[this.name]=[serializeObj[this.name],this.value];
                    }
                }else{
                    serializeObj[this.name]=this.value;
                }
            });
            return serializeObj;
        };

        function dialogWarning (msg) {
            BootstrapDialog.show({
                closable: false,
                type: BootstrapDialog.TYPE_WARNING,
                title: "提示",
                message: msg,
                buttons: [{
                    label: '确认',
                    cssClass: 'btn-warning',
                    action: function(dialogRef){
                        dialogRef.close();
                    }
                }]
            });
        }

        function endMsg (msg) {
            $("input").attr("disabled", true);
            $("textarea").attr("disabled", true);
            $("button").attr("disabled", true);
            $("select").attr("disabled", true);
            BootstrapDialog.show({
                closable: false,
                type: BootstrapDialog.TYPE_SUCCESS,
                title: "提示",
                message: msg,
                buttons: [{
                    label: '确认',
                    cssClass: 'btn-primary',
                    action: function(dialogRef){
                        dialogRef.close();
                    }
                }]
            });
        }

        function submitResult() {
            var runStatus = $("input:radio[name='runStatus']:checked").val();
            var checkUserPassword = $("#checkUserPassword").val();
            var checkUser = $("#checkUserId").val();
            if (runStatus == undefined
                || runStatus == 'undefined'
                || runStatus == null
                || runStatus == 'null'
                || runStatus.length < 1) {
                dialogWarning("必须选择设备状态");
            } else if (checkUser == undefined
                || checkUser == 'undefined'
                || checkUser == null
                || checkUser == 'null'
                || checkUser.length < 1) {
                dialogWarning("请选择巡检员");
            } else if (checkUserPassword == undefined
                || checkUserPassword == 'undefined'
                || checkUserPassword == null
                || checkUserPassword == 'null'
                || checkUserPassword.length < 1) {
                dialogWarning("请输入巡检员密码");
            }else {
                var ctx = $('#ctx').val();
                var data = $("#resultForm").serializeJson();
                $.ajax({
                    url : ctx + "/history/submitResult",
                    success:function(data){
                        if (data.status == 'success') {
                            endMsg(data.msg);
                        } else {
                            dialogWarning(data.msg);
                        }
                    },
                    complete:function(data){
                    },
                    type:"POST",
                    cache:false,
                    data:data
                });
            }
        }

        function importPictures() {
            $("#importPic").fileinput("upload");
        }

        function initFileInput(uploadUrl) {
            $("#importPic").fileinput({
                language:'zh',
                uploadUrl: uploadUrl,
                enableResumableUpload: true,
                maxFileCount: 2,
                browseLabel: '选择附件',
                dropZoneEnabled: false,
                showClose: false,
                maxFileSize: 2048,
                allowedFileExtensions : ['jpg', 'png','gif', 'jpeg']
            }).on("fileuploaded", function(e, data) {//文件上传成功的回调函数
                console.log("上传成功");
                var res = data.response;
            });
        }

        $(function(){
            // 提交结果判断
            var submitCheckResult = $('#submitCheckResult').val();
            $('#submitCheckResult').val('');
            if (submitCheckResult != undefined
                && submitCheckResult != 'undefined'
                && submitCheckResult != null
                && submitCheckResult != 'null'
                && submitCheckResult.length > 0) {
                dialogWarning(submitCheckResult);
            }
			//display1 display2
			var displayflag=$('#displayflag').val();
			$('#display1').css('display',displayflag);
			$('#display2').css('display',displayflag);
            // 上传图片初始化
            var ctx = $('#ctx').val();
            var businessId = $('#checkHistoryId').val();
            initFileInput(ctx + '/upload.file?fileType=1&businessId=' + businessId);
        });
    </script>
</head>
<body class="panel-body">
    <form id="resultForm" modelAttribute="checkResult" action="${ctx}/history/submitResult" method="post">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">设备信息</div>
            <div class="panel-body">
                <table class="table">
                    <caption>${equipment.eno}-${equipment.name}</caption>
                    <tbody>
                    <tr>
                        <td>设备编号</td>
                        <td>${equipment.eno}</td>
                    </tr>
                    <tr>
                        <td>设备名称</td>
                        <td>${equipment.name}</td>
                    </tr>
                    <tr>
                        <td>区域</td>
                        <td>${equipment.area}</td>
                    </tr>
                    <tr>
                        <td>位置</td>
                        <td>${equipment.location}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">巡检信息录入</div>
            <div class="panel-body">
                <input type="hidden" name="ctx" id="ctx" value="${ctx}"/>
                <input type="hidden" name="submitCheckResult" id="submitCheckResult" value="${submitCheckResult}"/>
                <input type="hidden" name="equipmentId" id="equipmentId" value="${equipment.id}"/>
                <input type="hidden" name="checkHistoryId" id="checkHistoryId" value="${checkHistoryId}"/>
                <input type="hidden" name="displayflag" id="displayflag" value="${displayflag}"/>
                <div class="form-group">
                    <label>消防设施是否被遮挡，灭火器箱是否完好，灭火器数量是否缺少</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field04" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field04" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器的铭牌是否残缺，并清晰明了</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field05" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field05" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器上关于灭火剂、驱动气体的种类、充装压力、总质量、灭火级别、制造厂名和生产日期或维修日期等标志及操作说明是否齐全</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field06" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field06" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器的铅封、销闩等保险装置是否损坏</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field07" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field07" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器的筒体是否无明显的损伤（磕伤、划伤）、缺陷、锈蚀（特别是筒底和焊缝）、泄漏</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field08" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field08" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器的喷射软管是否完好，无明显龟裂，喷嘴不堵塞</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field09" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field09" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器的驱动气体压力是否在工作压力范围</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field10" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field10" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>灭火器的零部件是否齐全，并且无松动、脱落或损伤现象</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field11" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field11" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div id="display1" class="form-group">
                    <label>水枪、水带、水管是否齐全，无破损，易连接</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field12" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field12" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div id="display2" class="form-group">
                    <label>消火栓水压是否正常，启泵按钮是否有效</label>
                    <div>
                        <label class="radio-inline">
                            <input name="field13" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="field13" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>设备总体运行状态</label>
                    <div>
                        <label class="radio-inline">
                            <input name="runStatus" type="radio" value="1" checked="checked" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="runStatus" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="comments">检查情况</label>
                    <textarea id="comments" name="comments" class="form-control" style="resize:none;" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label for="checkUserId">巡检员</label>
                    <select name="checkUser.id" id="checkUserId" class="form-control" >
                            <option value="">请选择</option>
				 			<c:forEach items="${xjUserList}" var="item">
	          		 				<option value="${item.id}">${item.name }</option>
	           				</c:forEach>
				 	</select>
                </div>
                <div class="form-group">
                    <label for="checkUserPassword">密码</label>
                    <input id="checkUserPassword" name="checkUserPassword" type="password" class="form-control" />
                </div>
                <div class="form-group">
                    <div class="file-loading">
                        <input id="importPic" name="importPic[]" type="file" multiple>
                    </div>
                </div>
                <div class="form-group">
                    <!--<button id="importPicturesBtn" type="button" class="btn btn-primary btn-block" onclick="importPictures()">上传图片</button>-->
                    <button id="submitBtn" type="button" class="btn btn-primary btn-block" onclick="submitResult()">提交</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
