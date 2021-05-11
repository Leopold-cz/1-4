package com.example.second.exception;

public class CustomException extends RuntimeException{

    private static final long serialVersionUID = 1L;
    private Integer code;
    private String msg;

    public CustomException(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public CustomException(ResultCodeEnum resultCodeEnum) {
        super(resultCodeEnum.getMessage());
        this.code = resultCodeEnum.getCode();
        this.msg = resultCodeEnum.getMessage();
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
