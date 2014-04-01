package com.dazhong;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Sign {
	// 定义申请获得的appKey和appSecret  
	String appkey = "50940582";  
	String secret = "bad7b27c30024a338d4a70ba63653d7f";  
	String apiUrl = "http://api.dianping.com/v1/business/find_businesses";  
	  
	public String getSign(String lo,String la) {
		
	
	// 创建参数表  
	
	Map<String, String> paramMap = new HashMap<String, String>();  
    //paramMap.put("format", "json");  
	paramMap.put("city", "深圳");  
	paramMap.put("latitude", la);  
	paramMap.put("longitude", lo);  
	/*paramMap.put("category", "美食");  
	paramMap.put("region", "长宁区");  
	paramMap.put("limit", "20");  
	paramMap.put("radius", "2000");  
	paramMap.put("offset_type", "0");  
	paramMap.put("has_coupon", "1");  
	paramMap.put("has_deal", "1");  
	paramMap.put("keyword", "泰国菜");  
	paramMap.put("sort", "7");  */
	  
	// 对参数名进行字典排序  
	String[] keyArray = paramMap.keySet().toArray(new String[0]);  
	Arrays.sort(keyArray);  
	  
	// 拼接有序的参数名-值串  
	StringBuilder stringBuilder = new StringBuilder();  
	stringBuilder.append(appkey);  
	for (String key : keyArray)  
	{  
	    stringBuilder.append(key).append(paramMap.get(key));  
	}  
	  
	stringBuilder.append(secret);  
	String codes = stringBuilder.toString();  
	 
	// 字符串连接示例  
	// XXXXXXXXcategory美食city上海formatjsonhas_coupon1has_deal1keyword泰国菜latitude31.21524limit20longitude121.420033offset_type0radius2000region长宁区sort7XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  
	  
	// SHA-1编码， 这里使用的是Apache codec，即可获得签名(shaHex()会首先将中文转换为UTF8编码然后进行sha1计算，使用其他的工具包请注意UTF8编码转换)  
	/* 
	 * 以下sha1签名代码效果等同 
	 * byte[] sha = org.apache.commons.codec.digest.DigestUtils.sha(org.apache.commons.codec.binary.StringUtils.getBytesUtf8(codes)); 
	 *  String sign = org.apache.commons.codec.binary.Hex.encodeHexString(sha).toUpperCase();  
	 */  
	String sign = org.apache.commons.codec.digest.DigestUtils.shaHex(codes).toUpperCase();  
	  return sign;
	//签名示例   
	//7D78381BC58E1DB1DBA4BD965916FE6B4D5DC892  
	}
}
