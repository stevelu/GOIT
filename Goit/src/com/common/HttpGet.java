package com.common;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.commons.httpclient.util.URIUtil;

public class HttpGet {
	
	public String sendHttpGet(String url, String params){
		
		//abandon
		
		String apiUrl = "http://api.dianping.com/v1/business/find_businesses";
        String appKey = "5589931241";    //请替换为自己的 App Key 和 App secret 
        String secret = "db16adf193f2448ba0ec0260e0c968f3";
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("city", "上海");
        paramMap.put("latitude", "31.21524");
        paramMap.put("longitude", "121.420033");
        paramMap.put("category", "美食");
        paramMap.put("region", "长宁区");
        paramMap.put("limit", "20");
        paramMap.put("radius", "2000");
        paramMap.put("offset_type", "0");
        paramMap.put("has_coupon", "1");
        paramMap.put("has_deal", "1");
        paramMap.put("keyword", "泰国菜");
        paramMap.put("sort", "7");
        paramMap.put("format", "json");

        StringBuilder stringBuilder = new StringBuilder();
        
        // 对参数名进行字典排序
        String[] keyArray = paramMap.keySet().toArray(new String[0]);
        Arrays.sort(keyArray);
        // 拼接有序的参数名-值串
        stringBuilder.append(appKey);
        for (String key : keyArray)
        {
            stringBuilder.append(key).append(paramMap.get(key));
        }
        String codes = stringBuilder.append(secret).toString();
        // SHA-1编码， 这里使用的是Apache-codec，即可获得签名(shaHex()会首先将中文转换为UTF8编码然后进行sha1计算，使用其他的工具包请注意UTF8编码转换)
        String sign = org.apache.commons.codec.digest.DigestUtils.shaHex(codes).toUpperCase();
       
        // 添加签名
        stringBuilder = new StringBuilder(); 
        stringBuilder.append("appkey=").append(appKey).append("&sign=").append(sign);
        for (Entry<String, String> entry : paramMap.entrySet())
        {
            stringBuilder.append('&').append(entry.getKey()).append('=').append(entry.getValue());
        }
        String queryString = stringBuilder.toString();

        StringBuffer response = new StringBuffer();
        HttpClientParams httpConnectionParams = new HttpClientParams();
        httpConnectionParams.setConnectionManagerTimeout(1000);
        HttpClient client = new HttpClient(httpConnectionParams);
        HttpMethod method = new GetMethod(apiUrl);

        BufferedReader reader = null;
        String encodeQuery = null;
		try {
			encodeQuery = URIUtil.encodeQuery(queryString, "UTF-8");
		} catch (URIException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // UTF-8 请求
        method.setQueryString(encodeQuery);
        try {
			client.executeMethod(method);
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
			reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String line = null;
        try {
			while ((line = reader.readLine()) != null)
			{
			    response.append(line).append(System.getProperty("line.separator"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        method.releaseConnection();

        System.out.println(response.toString());
		
	return response.toString();
		
	}

}
