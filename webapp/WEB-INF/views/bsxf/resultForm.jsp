<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>巡检结果提交</title>
    <script type="application/javascript">
        function submitResult() {
            var runStatus = $("input[name='runStatus']:checked").val();
            var userPassword = $("#userPassword").val();
            if (runStatus == undefined
                || runStatus == 'undefined'
                || runStatus == null
                || runStatus == 'null'
                || runStatus.length < 1) {
                alert('请选择状态');
            } else if (userPassword == undefined
                || userPassword == 'undefined'
                || userPassword == null
                || userPassword == 'null'
                || userPassword.length < 1) {
                alert('请输入你的密码');
            } else {
                $("#resultForm").submit();
            }
        }
    </script>
</head>
<body>
    <form:form id="resultForm" modelAttribute="equipment" action="${ctx}/equipment/submitResult" method="post" class="form-horizontal">
        <input type="hidden" name="id" id="id" value="${equipment.id}"/>
        <table class="inputView" style="width: 100%;">
            <tr>
                <td class="left">设备编号:</td>
                <td class="right"><label size="120" >${equipment.eno}</label><input id="eno" name="eno" type="hidden" value="${equipment.eno}"/> </td>
            </tr>
            <tr>
                <td class="left">设备名称:</td>
                <td class="right"><label size="120" >${equipment.name}</label><input id="name" name="name" type="hidden" value="${equipment.name}"/></td>
            </tr>
            <tr>
                <td class="left">区域:</td>
                <td class="right"><label size="120" >${equipment.area}</label><input id="area" name="area" type="hidden" value="${equipment.area}"/></td>
            </tr>
            <tr>
                <td class="left">位置:</td>
                <td class="right"><label size="120" >${equipment.location}</label><input id="location" name="location" type="hidden" value="${equipment.location}"/></td>
            </tr>
            <tr>
                <td class="left">状态:</td>
                <td class="right">
                    <label><input name="runStatus" type="radio" value="1" />正常 </label>
                    <label><input name="runStatus" type="radio" value="2" />异常 </label>
                </td>
            </tr>
            <tr>
                <td class="left">巡检员密码:</td>
                <td class="right"><input id="userPassword" name="userPassword" type="password" size="120" value="" class="required" /></td>
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
