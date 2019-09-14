package org.bsxf.common.entity.bsxf;

import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Description;

public class CheckResult {
    @Description(description = "设备ID")
    private String equipmentId;
    @Description(description = "巡检记录ID")
    private String checkHistoryId;
    @Description(description = "状态：1-正常工作；2-运行异常")
    private String runStatus;
    @Description(description = "巡检员密码")
    private String checkUserPassword;
    @Description(description = "详细描述")
    private String comments;
    @Description(description = "巡检负责人")
    private User checkUser;

    public String getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(String equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getCheckHistoryId() {
        return checkHistoryId;
    }

    public void setCheckHistoryId(String checkHistoryId) {
        this.checkHistoryId = checkHistoryId;
    }

    public String getRunStatus() {
        return runStatus;
    }

    public void setRunStatus(String runStatus) {
        this.runStatus = runStatus;
    }

    public String getCheckUserPassword() {
        return checkUserPassword;
    }

    public void setCheckUserPassword(String checkUserPassword) {
        this.checkUserPassword = checkUserPassword;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public User getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(User checkUser) {
        this.checkUser = checkUser;
    }
}
