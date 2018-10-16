package com.own.template.jackson;
/**
 * @description:
 * @author:         mc
 * @createDate:     2018/6/29 9:03
 * @version:        1.0
 */
public enum Tips {

    FAIL(300,"失败"),
    SUCCESS(200,"成功"),


    DISABLED_TOEK(401,"token过期或该账号已在其它地方登陆"),
    USER_EMAIL_HAD("该邮箱已注册"),
    USER_PASSWORD_FALSE("用户名或密码错误"),
    USER_PASSWORD_F("旧密码错误"),
    DATA_NOT("数据不存在"),
	DATA_YES("数据已存在"),
    MSG_YES("信息已存在"),
    USER_NOT("用户不存在"),
    USER_DATA_ERROE("基础数据匹配异常"),
    USER_USERNAME_HAD("该账号已注册,请联系系统管理员"),
    USER_GRID_ROLE_ERROR("权限不足"),
    USER_ROLE_ERROR("用户已存在该权限"),
    USER_CODE_ERROR("请不要刷取短信"),
    USER_ACTIVATION_YES("用户已经激活，请不要重复激活"),
    USER_ACTIVATION_ERROR("已经处理了该条申请了"),

    CODE_FALSE("验证码错误"),
    PARAMETER_ERROR("参数有误"),
    ABNORMAL("异常，请联系管理员"),
    ACCOUNT_FALSE("该账号已被管理员禁用或删除，请联系管理员"),
    PHONE_NOT("请输入正确的手机号"),
    SOCKTE_MSG_NOT("离线消息发送失败"),
    NOTICE_NOT("公告发送失败"),

    GRADE_SCORE_ERROR("评分分数越界"),
    EXAMINE_PERFORMANCE_ERROR("考核绩效越界"),

    ;
    public Integer code;
    public String msg;


    Tips(String msg) {
        /**
         * 消息
         */
        this.msg = msg;
    }

    Tips(Integer code, String msg) {
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
