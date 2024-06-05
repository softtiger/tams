package com.nytkm.tams.common;

import java.io.Serializable;
import java.util.Map;

public class ResultJSONObject<V> implements Serializable {

	private static final long serialVersionUID = 6305779772613611507L;

    private Integer resultCode;

    private String message;

    private Object reason;

    private V data;


    public static  ResultJSONObject success(){
            return  new ResultJSONObject(RespCode.SUCCESS) ;
    }

    public static  <V> ResultJSONObject success(V data){
        ResultJSONObject result = new ResultJSONObject(RespCode.SUCCESS) ;
        result.setData(data);
        return result;
    }

    public static  ResultJSONObject  validFailure(Map reason){
        return  new ResultJSONObject(RespCode.PARAM_ERROR,reason) ;
    }

    public static  ResultJSONObject  noHandlerError(String reason){
        return  new ResultJSONObject(RespCode.PATH_ERROR,reason) ;
    }

    public static  ResultJSONObject  OptimisticLockingFailure(String reason){
        return  new ResultJSONObject(RespCode.OPTIMISTICK_LOCKING_FAILURE,reason) ;
    }

    public static  ResultJSONObject  AccountDisabled(String reason){
        return  new ResultJSONObject(RespCode.USER_BLACKS_ERROR,reason) ;
    }

    public static  ResultJSONObject  AccountIncorrect(String reason){
        return  new ResultJSONObject(RespCode.USER_ACCOUNT_ERROR,reason) ;
    }



    private ResultJSONObject() {
    }

	public ResultJSONObject(RespCode resp) {
        this(resp,null);
	}

	
	public ResultJSONObject(RespCode resp, Object reason) {
        this(resp,reason,null);
	}

    public ResultJSONObject(RespCode resp, Object reason, V data) {
        setResultCode(resp.getCode());
        setMessage(resp.getMessage());
        setReason(reason);
        setData(data);
    }


    public Integer getResultCode() {
        return resultCode;
    }

    public void setResultCode(Integer resultCode) {
        this.resultCode = resultCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getReason() {
        return reason;
    }

    public void setReason(Object reason) {
        this.reason = reason;
    }

    public Object getData() {
        return data;
    }

    public void setData(V data) {
        this.data = data;
    }
}
