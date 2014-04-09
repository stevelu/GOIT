<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
!window.jQuery && document.write('<script src=http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js><\/script>');
//-->
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
</head>
<body >
<div id="people" class="dragsource" title ="people">
<p id="targetMsg">people1</p>
<h>people1</h>
</div>
<div id="time" class="dragsource" title ="time">
<p id="targetMsg">time1</p>
<h>time1</h>
</div>
<ls class="place">
<div id="place" class="dragsource" title ="place">
<p id="la">la</p>
<p id="ln">ln</p>
<h>place1</h>
</div>
</ls>
<div>
<p1>drag here<p2>
<div id="droppable" style="background-color:gray;height:500;display:none">
<p>Can drop! </p>
<form id ="event" class="form" method="post" action="GetEvent">
<input type="submit">
</form>
</div>
</div>

<script>
$(function() {
$( ".dragsource" ).draggable({
start: function(event,ui) {
$(this).find("p").html("drag to event");
$( "#droppable" ).fadeIn(300);
},
stop:function(event,ui){

//$( "#droppable" ).fadeOut(300);
/* var text="<input value=\""+$(this).attr("title")+"\"></input>";
$("#event").append(text); */
if ($( "#droppable" ).find( "p" ).text()=="I've got it!")
	{
	   $(this).find("p").html("in"); 
	  var text="<input name=\""+$(this).attr("title")+"\"  value=\""+$(this).find("h").text()+"\"></input>";
	  $("#event").append(text); 
	}

}
});
$( "#droppable" ).droppable({
activate: function(event,ui) {
$(this).find("p").html( "Drop here !" );

},
over: function(event,ui) {
$( this ).find( "p" ).html( "Oh, Yeah!" );

},
out: function(event,ui) {
$( this ).find( "p" ).html( "Don't leave me!" );

},
drop: function( event, ui ) {
$( this ).find( "p" ).html( "I've got it!" );
}
});
})
</script>
</body>
</html>