<%@page import="com.dazhong.model.businesses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Iterator" %> 
    <%@page import="java.util.Map" %> 
    <%@page import="java.util.List" %> 
    <%@page import="com.common.json" %> 
    <%@page import="com.dazhong.model.dataJson" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">  
var cluster;  
var markers= [];  
/* 
 *添加点标记  
 */  
function addPoint(la,ln) {  
/* 	var LngLatX = ln; //获取Lng值  
    var LngLatY = la; //获取Lat值  
    marker = new AMap.Marker({                  
        icon:"http://webapi.amap.com/images/marker_sprite.png",  
        position:new AMap.LngLat(LngLatX,LngLatY)  
    });  
  
    marker.setMap(mapObj);  //在地图上添加点  
    mapObj.setFitView(); //调整到合理视野    */
    
     var LngLatX = ln; //获取Lng值  
    var LngLatY = la; //获取Lat值  
     marker = new AMap.Marker({  
    	
    	//beyond自定义图标
    	  icon:new AMap.Icon({    //复杂图标    	
            size:new AMap.Size(28,37),//图标大小  
            image:"http://webapi.amap.com/images/custom_a_j.png", //大图地址  
            imageOffset:new AMap.Pixel(-28,0)//相对于大图的取图位置  
        }),  
        
        position:new AMap.LngLat(LngLatX,LngLatY),
        //draggable:true, //点标记可拖拽  
        cursor:'move',  //鼠标悬停点标记时的鼠标样式  
        //raiseOnDrag:true,//鼠标拖拽点标记时开启点标记离开地图的效果  
        //by beyond
        clickable:true
        //content:'<div id=\"maker\">@<div>'
        
        
       
  
    });  
	AMap.event.addListener(marker, 'rightclick',function(){marker.setContent("<div id=\"maker\">"+marker.getPosition()+"<button onclick=\"addPointToEvent("+marker.getPosition().getLat()+","+marker.getPosition().getLng()+")\">add to event</button><div>");} );
    marker.setMap(mapObj); 
}

</script> 
</head>
<body>
 <form id="dazhong" method="get" action="http://api.dianping.com/v1/deal/find_deals?" style="display:none">
<input name="appkey" type="text" id ="1" value="50940582">
<input name="sign"  type="text" id ="2" value="<%=request.getAttribute("sign")%>">
<input name="city"  type="text" id ="3" value="深圳">
<input name="longitude"  type="text"  id="4" value="<%=request.getAttribute("ln")%>">  
<input name="latitude"  type="text"  id="5" value="<%=request.getAttribute("la")%>"> 
<input type="submit"    >
 </form> 
 <table border="1">

<%/* if(request.getAttribute("sign")!=null)
{
	 System.out.println("<form id=\"dazhong\" method=\"get\" action=\"http://api.dianping.com/v1/deal/find_deals?\">");
	 System.out.println("<input name=\"appkey\" type=\"text\" id =\"1\" value=\"50940582\">");
	 System.out.printf("<input name=\"sign\" type=\"text\" id =\"2\" value=\"%s\">",request.getAttribute("sign").toString());
	 System.out.println("<input name=\"city\" type=\"text\" id =\"3\" value=\"深圳\">");
	 System.out.printf("<input name=\"longitude\" type=\"text\"  id=\"4\" value=\"%s\">",request.getAttribute("ln").toString());  
	 System.out.printf("<input name=\"latitude\" type=\"text\"  id=\"5\" value=\"%s\"",request.getAttribute("la").toString()); 
	 System.out.printf("<input type=\"submit\">");
			 System.out.printf("</form> ");

} */
 if(request.getAttribute("map")!=null)
 {
	 dataJson Json=new dataJson();
	 Json=(dataJson)request.getAttribute("map");
	 List<businesses> buses= Json.getBusinesses();
	 for(Iterator i =buses.iterator(); i.hasNext();)  
     {
			businesses bu=(businesses) i.next();
			String la=bu.getLatitude();
			String ln=bu.getLongitude();
			String name=bu.getName();
			String address=bu.getAddress();
			%>
			
			<tr onmouseover=addPoint(<%=la %>,<%=ln %>)><td>name</td><td><%=name%></td></tr>
			<tr onmouseover=addPoint(<%=la %>,<%=ln %>)><td>addresss</td><td><%=address%></td></tr><%
     }
 }

 %>
 
  
</table>
 
</body>
</html>