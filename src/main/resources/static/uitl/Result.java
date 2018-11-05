package com.liaoin.meeting.uitl;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 前端JSON返回格式,自定义响应格式
 *
 * @author mc
 * @version 1.0
 * @date 2018/10/30 12:52
 * @description
 */
public class Result implements Serializable {
	/**
	 * 定义jackson对象
	 */
	private static final ObjectMapper MAPPER = new ObjectMapper();

	/**
	 * 响应业务状态
	 */
	private Integer state;

	/**
	 * 响应消息
	 */
	private String message;

	/**
	 * 响应中的数据
	 */
	private Object data = "";

	public Result(Integer state, String message) {
		this.state = state;
		this.message = message;
	}

	public static Map buildMap(String name, Object object) {
		Map<String, Object> map = new HashMap(16);
		map.put("name", name);
		map.put("value", object);
		return map;
	}

	public static Map resultMap(String key, Object object) {
		Map<String, Object> map = new HashMap(16);
		map.put(key, object);
		return map;
	}

	public static com.liaoin.meeting.uitl.Result build(Integer state, String message, Object data) {
		return new com.liaoin.meeting.uitl.Result(state, message, data);
	}

	public static com.liaoin.meeting.uitl.Result ok(Object data) {
		return new com.liaoin.meeting.uitl.Result(data);
	}

	public static com.liaoin.meeting.uitl.Result ok() {
		return new com.liaoin.meeting.uitl.Result(new ArrayList<>());
	}

	public Result() {

	}

	public static com.liaoin.meeting.uitl.Result build(Integer state, String message) {
		return new com.liaoin.meeting.uitl.Result(state, message, null);
	}

	public static com.liaoin.meeting.uitl.Result fail() {
		return new com.liaoin.meeting.uitl.Result(com.liaoin.meeting.uitl.Tips.FAIL.code, com.liaoin.meeting.uitl.Tips.FAIL.msg);
	}

	public static com.liaoin.meeting.uitl.Result fail(String msg) {
		return new com.liaoin.meeting.uitl.Result(com.liaoin.meeting.uitl.Tips.FAIL.code, msg);
	}

	public static com.liaoin.meeting.uitl.Result fail(Integer code, String msg) {
		return new com.liaoin.meeting.uitl.Result(code, msg);
	}

	public Result(Integer state, String message, Object data) {
		this.state = state;
		this.message = message;
		this.data = data;
	}

	public static com.liaoin.meeting.uitl.Result fail(Object data) {
		return new com.liaoin.meeting.uitl.Result(com.liaoin.meeting.uitl.Tips.FAIL.code, com.liaoin.meeting.uitl.Tips.FAIL.msg, data);
	}

	public Result(Object data) {
		this.state = 200;
		this.message = "OK";
		this.data = data;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	/**
	 * 将json结果集转化为esult对象
	 *
	 * @param jsonData json数据
	 * @param clazz    FrontResult中的object类型
	 */
	public static com.liaoin.meeting.uitl.Result formatToPojo(String jsonData, Class<?> clazz) {
		try {
			if (clazz == null) {
				return MAPPER.readValue(jsonData, com.liaoin.meeting.uitl.Result.class);
			}
			JsonNode jsonNode = MAPPER.readTree(jsonData);
			JsonNode data = jsonNode.get("data");
			Object obj = null;
			if (data.isObject()) {
				obj = MAPPER.readValue(data.traverse(), clazz);
			} else if (data.isTextual()) {
				obj = MAPPER.readValue(data.asText(), clazz);
			}
			return build(jsonNode.get("state").intValue(), jsonNode.get("message").asText(), obj);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 没有object对象的转化
	 */
	public static com.liaoin.meeting.uitl.Result format(String json) {
		try {
			return MAPPER.readValue(json, com.liaoin.meeting.uitl.Result.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Object是集合转化
	 *
	 * @param jsonData json数据
	 * @param clazz    集合中的类型
	 */
	public static com.liaoin.meeting.uitl.Result formatToList(String jsonData, Class<?> clazz) {
		try {
			JsonNode jsonNode = MAPPER.readTree(jsonData);
			JsonNode data = jsonNode.get("data");
			Object obj = null;
			if (data.isArray() && data.size() > 0) {
				obj = MAPPER.readValue(data.traverse(),
						MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
			}
			return build(jsonNode.get("state").intValue(), jsonNode.get("message").asText(), obj);
		} catch (Exception e) {
			return null;
		}
	}

}
