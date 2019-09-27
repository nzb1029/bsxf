package org.bsxf.common.entity.bsxf;

import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Description;

public class CheckResult {
    @Description(description = "设备ID")
    private String equipmentId;
    @Description(description = "巡检记录ID")
    private String checkHistoryId;
    @Description(description = "巡检负责人")
    private User checkUser;
    @Description(description = "详细描述")
    private String comments;
    @Description(description = "巡检员密码")
    private String checkUserPassword;
    @Description(description = "状态：1-正常工作；2-运行异常")
    private String runStatus;
    @Description(description = "扩展字段")
	protected String field04="1";
	@Description(description = "扩展字段")
	protected String field05="1";
	@Description(description = "扩展字段")
	protected String field06="1";
	@Description(description = "扩展字段")
	protected String field07="1";
	@Description(description = "扩展字段")
	protected String field08="1";
	@Description(description = "扩展字段")
	protected String field09="1";
	@Description(description = "扩展字段")
	protected String field10="1";
	@Description(description = "扩展字段")
	protected String field11="1";
	@Description(description = "扩展字段")
	protected String field12="1";
	@Description(description = "扩展字段")
	protected String field13="1";
	@Description(description = "扩展字段")
	protected String field14="1";
	
    public String getEquipmentId() {
        return equipmentId;
    }

	public String getField04() {
		return field04;
	}

	public void setField04(String field04) {
		this.field04 = field04;
	}

	public String getField05() {
		return field05;
	}

	public void setField05(String field05) {
		this.field05 = field05;
	}

	public String getField06() {
		return field06;
	}

	public void setField06(String field06) {
		this.field06 = field06;
	}

	public String getField07() {
		return field07;
	}

	public void setField07(String field07) {
		this.field07 = field07;
	}

	public String getField08() {
		return field08;
	}

	public void setField08(String field08) {
		this.field08 = field08;
	}

	public String getField09() {
		return field09;
	}

	public void setField09(String field09) {
		this.field09 = field09;
	}

	public String getField10() {
		return field10;
	}

	public void setField10(String field10) {
		this.field10 = field10;
	}

	public String getField11() {
		return field11;
	}

	public void setField11(String field11) {
		this.field11 = field11;
	}

	public String getField12() {
		return field12;
	}

	public void setField12(String field12) {
		this.field12 = field12;
	}

	public String getField13() {
		return field13;
	}

	public void setField13(String field13) {
		this.field13 = field13;
	}

	public String getField14() {
		return field14;
	}

	public void setField14(String field14) {
		this.field14 = field14;
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
