package com.dazhong;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Iterator;



public class DataDeal {

	public String para2URL(Map <String, String> map) {
		String paraURLString="";
		Set set = map.keySet();
		for(Iterator iter = set.iterator(); iter.hasNext();)
		  {
		   String key = (String)iter.next();
		   String value = (String)map.get(key);
		   System.out.println(key+"===="+value);
		   if (paraURLString==""){
			   paraURLString=key+"="+URLEncoder.encode(value);
		   }else {
			   paraURLString=paraURLString+"&"+key+"="+URLEncoder.encode(value);
		}
		  }
		return paraURLString;
		
	}

}

