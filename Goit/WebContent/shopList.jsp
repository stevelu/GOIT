<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Iterator" %> 
    <%@page import="java.util.Map" %> 
    <%@page import="com.common.json" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">  

</script> 
</head>
<body>
 <form id="dazhong" method="get" action="http://api.dianping.com/v1/deal/find_deals?">
<input name="appkey" type="text" id ="1" value="50940582">
<input name="sign" type="text" id ="2" value="<%=request.getAttribute("sign")%>">
<input name="city" type="text" id ="3" value="深圳">
<input name="longitude" type="text"  id="4" value="<%=request.getAttribute("ln")%>">  
<input name="latitude" type="text"  id="5" value="<%=request.getAttribute("la")%>"> 
<input type="submit"    >
 </form> 
 <table border="1">"
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
 Map<?, ?> dazhongMap=(Map<?, ?>)request.getAttribute("map");
 Iterator iter = dazhongMap.entrySet().iterator(); 
while (iter.hasNext()) { 
    Map.Entry entry = (Map.Entry) iter.next(); 
    Object key = entry.getKey(); 
    Object val = entry.getValue();  %>
    <tr><td><%= key.toString()%></td><td><%= val.toString()%></td></tr>
  <% 
} 

 }

%>
</table>
 
</body>
</html>