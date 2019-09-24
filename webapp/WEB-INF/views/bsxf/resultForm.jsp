<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        function submitResult() {
            var runStatus = $("input:radio[name='runStatus']:checked").val();
            var checkUserPassword = $("#checkUserPassword").val();
            if (runStatus == undefined
                || runStatus == 'undefined'
                || runStatus == null
                || runStatus == 'null'
                || runStatus.length < 1) {
                dialogWarning("必须选择设备状态");
            } else if (checkUserPassword == undefined
                || checkUserPassword == 'undefined'
                || checkUserPassword == null
                || checkUserPassword == 'null'
                || checkUserPassword.length < 1) {
                dialogWarning("请输入巡检员密码");
            } else {
                $("#resultForm").submit();
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
            // 默认值
            var oldRunStatus = $('#oldRunStatus').val();
            $('input:radio[name="runStatus"][value="'+oldRunStatus+'"]').prop('checked', true);
            var oldComments = $('#oldComments').val();
            $('#comments').val(oldComments);
            var oldCheckUserPassword = $('#oldCheckUserPassword').val();
            $('#checkUserPassword').val(oldCheckUserPassword);
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
                    <tr>
                        <td>巡检员</td>
                        <td>${equipment.checkUser.name}</td>
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
                <input type="hidden" name="oldRunStatus" id="oldRunStatus" value="${oldRunStatus}"/>
                <input type="hidden" name="oldComments" id="oldComments" value="${oldComments}"/>
                <input type="hidden" name="oldCheckUserPassword" id="oldCheckUserPassword" value="${oldCheckUserPassword}"/>
                <input type="hidden" name="equipmentId" id="equipmentId" value="${equipment.id}"/>
                <input type="hidden" name="checkHistoryId" id="checkHistoryId" value="${checkHistoryId}"/>
                <input type="hidden" name="checkUser.id" id="checkUserId" value="${equipment.checkUser.id}"/>
                <div class="form-group">
                    <label>设备状态</label>
                    <div>
                        <label class="radio-inline">
                            <input name="runStatus" type="radio" value="1" />正常
                        </label>
                        <label class="radio-inline">
                            <input name="runStatus" type="radio" value="2" />异常
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="comments">描述</label>
                    <textarea id="comments" name="comments" class="form-control" style="resize:none;" rows="3"></textarea>
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
