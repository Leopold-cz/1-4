package com.example.second.exception;

import lombok.Getter;

@Getter
public enum ResultCodeEnum {

    SUCCESS(true,20000,"成功"),
    EXCEPTION(false,10000,"系统异常，请稍后重试"),
    NAME_INPUT_ERROR(false,14001,"姓名格式输入错误"),
    AGE_INPUT_ERROR(false,14002,"年龄格式输入错误"),
    PHONE_INPUT_ERROR(false,14003,"电话格式输入错误"),
    EMAIL_INPUT_ERROR(false,14004,"邮箱格式输入错误"),
    IDENTIFY_INPUT_ERROR(false,14004,"身份证格式输入错误"),
    HEIGHT_INPUT_ERROR(false,14005,"身高格式输入错误"),
    WEIGHT_INPUT_ERROR(false,14006,"体重格式输入错误");


    private  Boolean success;

    private Integer code;

    private  String message;

    ResultCodeEnum(Boolean success, Integer code, String message) {
        this.success = success;
        this.code = code;
        this.message = message;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
