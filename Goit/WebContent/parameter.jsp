<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js" type="text/javascript"></script>
</head>
<body >
<div id="dragsource" class="dragsource" title ="people1">
<p id="targetMsg">people</p>
</div>
<div id="time" class="dragsource" title ="time1">
<p id="targetMsg">time</p>
</div>
<div id="place" class="dragsource" title ="place1">
<p id="targetMsg">place</p>
</div>
<div>
<p1>drag here<p2>
<div id="droppable" style="background-color:gray;height:500;display:none">
<p>Can drop! </p>
<from id ="event" class="from">
</from>
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
$(this).find("p").html("in");
//$( "#droppable" ).fadeOut(300);
var text="<input value=\""+$(this).attr("title")+"\"></input>";
$("#event").append(text);

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