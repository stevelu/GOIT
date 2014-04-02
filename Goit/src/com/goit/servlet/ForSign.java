package com.goit.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.HttpGet;
import com.common.URLConnectionHelper;
import com.common.json;
import com.dazhong.Sign;
import com.dazhong.DataDeal;
import com.dazhong.model.businesses;
import com.dazhong.model.dataJson;
import com.google.gson.Gson;
import com.sun.xml.internal.bind.v2.TODO;

/**
 * Servlet implementation class ForSign
 */
public class ForSign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForSign() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doService(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doService(request, response);
	}
	private void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		String appkey="50940582";
		String ln=request.getParameter("longitude");
		String la=request.getParameter("latitude");
		Sign sign=new Sign();
		String city="深圳";
		String signString=sign.getSign(ln,la);
		
		/*RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		request.setAttribute("ln", ln);
		request.setAttribute("la", la);
		request.setAttribute("sign", signString);
		rd.forward(request, response);*/
		
		//TODO send get data
		String apiUrl = "http://api.dianping.com/v1/business/find_businesses"; 
		Map<String, String> map = new LinkedHashMap<String, String>();
		  
		  map.put("appkey",appkey);
		  map.put("sign",signString);
		  map.put("city",city);
		  map.put("longitude",ln);
		  map.put("latitude",la);
		  DataDeal deal=new DataDeal();
		String params=deal.para2URL(map);
		URLConnectionHelper helper=new URLConnectionHelper();
		String str =helper.sendGetBY(apiUrl, params);
		/*HttpGet get=new HttpGet();
		String str=get.sendHttpGet(apiUrl, params);*/
		/*json json=new json();
		Map<?, ?> dazhongMap=json.jsonToMap(str);*/
		Gson gson=new Gson();
		dataJson daJson=new dataJson();
		daJson=gson.fromJson(str, dataJson.class);
		List<businesses> bus =daJson.getBusinesses();
		Map<String, String> dazhongMap=new LinkedHashMap<>() ;
		int j=1;
		for(Iterator i =bus.iterator(); i.hasNext();)  
        {
			businesses bu=(businesses) i.next();
			String name="name"+j;
			String address="address"+j;
			dazhongMap.put(name, bu.getName());
			dazhongMap.put(address, bu.getAddress());
			j++;
        }
		//TODO transfrom 
         RequestDispatcher rd = request.getRequestDispatcher("index.jsp");  
         request.setAttribute("map",dazhongMap);//存值  
         rd.forward(request,response);
         
         
		
    }
	


}
