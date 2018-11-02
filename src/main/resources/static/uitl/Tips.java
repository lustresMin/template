package com.liaoin.meeting.uitl;

public enum Tips {
	/**
	 *
	 */
    FAIL("400","失败"),
    SUCCESS("200","成功"),

    DISABLED_TOEK("401","token过期或该账号已在其它地方登陆"),
    USER_EMAIL_HAD("该邮箱已注册"),
    USER_PASSWORD_FALSE("用户名或密码错误"),
    USER_PASSWORD_F("旧密码错误"),
    MSG_NOT("信息不存在"),
    MSG_YES("信息已存在"),
    CODE_FALSE("验证码错误"),
    PARAMETER_ERROR("参数有误"),
    ERROR("异常！,请联系管理员"),
    MEETING_SIGN_IN("错误，会议已进行签到"),
    ;
    public String code;
    public String msg;


    Tips(String msg) {
        /**
         * 消息
         */
        this.msg = msg;
    }

    Tips(String code, String msg) {
        /**
         * 状态码
         */
        this.code = code;
        /**
         * 消息
         */
        this.msg = msg;
    }
}
