<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://api.amap.com/Public/css/demo.Default.css" /> 
<script language="javascript" src="http://webapi.amap.com/maps?v=1.2&key=8685c757462e9bbddecba8e4e9505ebb"></script>  
<script language="javascript">  
var mapObj;  
//初始化地图对象，加载地图  
function mapInit(){  
	 mapObj = new AMap.Map("iCenter");//初始化加载地图时，若center及level属性缺省，地图默认显示用户当前城市范围  
     
	    //地图中添加地图操作ToolBar插件  
	    mapObj.plugin(["AMap.ToolBar"],function(){    
	        mapObj.addControl(toolBar);       
	    });   
	 
	 // beyond 点标记

	    	addMarker(); 

} 

//在地图上添加点标记函数  
function addMarker(){  
	
	
	var marker = new AMap.Marker({  
    	
    	//beyond自定义图标
    	  icon:new AMap.Icon({    //复杂图标    	
            size:new AMap.Size(28,37),//图标大小  
            image:"http://webapi.amap.com/images/custom_a_j.png", //大图地址  
            imageOffset:new AMap.Pixel(-28,0)//相对于大图的取图位置  
        }),  
        
        position:mapObj.getCenter(), 
        draggable:true, //点标记可拖拽  
        cursor:'move',  //鼠标悬停点标记时的鼠标样式  
        raiseOnDrag:true,//鼠标拖拽点标记时开启点标记离开地图的效果  
        //by beyond
        clickable:true,
        //content:'<div id=\"maker\">@<div>'
        
        
       
  
    });  
	AMap.event.addListener(marker, 'rightclick',function(){marker.setContent("<div id=\"maker\">"+marker.getPosition()+"<button onclick=\"addPointToEvent("+marker.getPosition().getLat()+","+marker.getPosition().getLng()+")\">add to event</button><div>");} );
    marker.setMap(mapObj);  
   
    
}  

//beyond add map point for event

function addPointToEvent(la,ln)
{ 
   
	var place=$("div#place").clone().attr("id","place1");
	$(place).find("p#la").text( la);
	$(place).find("p#ln").text( ln);
	$(place).find("h").text("Event1");
	$(place).draggable();
	$(place).appendTo("ls.place");


	
 	/* var place=document.createElement("div");
	place.setAttribute("id","place1");
	place.setAttribute("class","dragsource");
	place.setAttribute("style","position: relateve;");
	place.setAttribute("title","place"); 	
    var la=document.createElement("p");
    la.setAttribute("id","la");
    la.innerHTML="la";
    place.appendChild(la);
    var ln=document.createElement("p");
    ln.setAttribute("id","ln");
    ln.innerHTML="ln";
    place.appendChild(ln);
    var h=document.createElement("h");
    h.innerHTML="Event1";
    place.appendChild(h);
	 $("ls.place").append(place); */

	}
	
	
//自定义鼠标样式图标
function switchCursor()  
{  
    mapObj.setDefaultCursor("url(http://webapi.amap.com/images/0.png),crosshair");  
}  

//获取地图中心点  
function getMapCenter(){  
    var mapCenter = mapObj.getCenter();  
    document.getElementById("centerInfo").innerHTML = "当前地图中心点坐标："+mapCenter.getLng()+","+mapCenter.getLat();  
//TODO 键值对
    var p=new Array();
    //P[1]=mapCenter.getLng();
   // P[2]=mapCenter.getLat();  
   var p=mapCenter.getLng();
   var n=mapCenter.getLat();
    postwith("ForSign",{'longitude':p,'latitude':n});
} 

//传值给jsp
function postwith(to, p) {
var myForm = document.createElement("form");
myForm.method = "post";
myForm.action = to;
for ( var k in p) {
var myInput = document.createElement("input");
myInput.setAttribute("name", k);
myInput.setAttribute("value", p[k]);
myForm.appendChild(myInput);
}
document.body.appendChild(myForm);
myForm.submit();
document.body.removeChild(myForm);
}





</script> 

</head>
<body onLoad="mapInit()">  
    <div id="iCenter"></div>  
    <div style="padding:2px 0px 0px 5px;font-size:12px">   
    <input type="button" value="自定义鼠标样式图标" onClick="switchCursor()"/>    
     <input type="button" value="获取地图中心点" onClick="javascript:getMapCenter()"/>   
      <div id="centerInfo"></div>         
       <!--  <div id="info" style="margin-top:10px;margin-left:10px">初始化加载地图时，center及level属性缺省，地图默认显示用户所在城市范围</div>  -->
    </div>   
    <h>ready for ui</h>
    <%@ include file ="parameter.jsp" %>
    <%@ include file ="shopList.jsp" %>
     

     <!--  <Iframe src= "shopList.jsp" width= "100%" height= "100%" scroll= "no" frameborder= "0" name= "content" > </iframe> -->
   
</body> 
</html>