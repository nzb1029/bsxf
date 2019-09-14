<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>巡检结果提交</title>
    <script type="application/javascript">
        function submitResult() {
            var runStatus = $("input[name='runStatus']:checked").val();
            var checkUserPassword = $("#checkUserPassword").val();
            if (runStatus == undefined
                || runStatus == 'undefined'
                || runStatus == null
                || runStatus == 'null'
                || runStatus.length < 1) {
                alert('请选择状态');
            } else if (checkUserPassword == undefined
                || checkUserPassword == 'undefined'
                || checkUserPassword == null
                || checkUserPassword == 'null'
                || checkUserPassword.length < 1) {
                alert('请输入你的密码');
            } else {
                $("#resultForm").submit();
            }
        }
    </script>
</head>
<body>
    <form:form id="resultForm" modelAttribute="checkResult" action="${ctx}/history/submitResult" method="post" class="form-horizontal">
        <input type="hidden" name="equipmentId" id="equipmentId" value="${equipment.id}"/>
        <input type="hidden" name="checkUser.id" id="checkUserId" value="${equipment.checkUser.id}"/>
        <table class="inputView" style="width: 100%;">
            <tr>
                <td class="left">设备编号:</td>
                <td class="right"><label size="120" >${equipment.eno}</label></td>
            </tr>
            <tr>
                <td class="left">设备名称:</td>
                <td class="right"><label size="120" >${equipment.name}</label></td>
            </tr>
            <tr>
                <td class="left">区域:</td>
                <td class="right"><label size="120" >${equipment.area}</label></td>
            </tr>
            <tr>
                <td class="left">位置:</td>
                <td class="right"><label size="120" >${equipment.location}</label></td>
            </tr>
            <tr>
                <td class="left">状态:</td>
                <td class="right">
                    <label><input name="runStatus" type="radio" value="1" />正常 </label>
                    <label><input name="runStatus" type="radio" value="2" />异常 </label>
                </td>
            </tr>
            <tr>
                <td class="left">描述:</td>
                <td class="right">
                    <textarea id="comments" name="comments" ></textarea>
                </td>
            </tr>
            <tr>
                <td class="left">巡检员:</td>
                <td class="right"><label size="120" >${equipment.checkUser.name}</label></td>
            </tr>
            <tr>
                <td class="left">巡检员密码:</td>
                <td class="right"><input id="checkUserPassword" name="checkUserPassword" type="password" size="120" value="" class="required" /></td>
            </tr>
            <tr>
                <td colspan="2" class="bottom">
                    <input class="btn btn-primary" id="submitBtn" value="提交" onclick="submitResult()"/>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>
