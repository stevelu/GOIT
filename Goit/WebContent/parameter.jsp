<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/parameter.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
!window.jQuery && document.write('<script src=http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js><\/script>');
//-->
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
</head>
<body >

<fieldset>
<div id="allEvent" class="captcha_wrap">
<div class="captcha">EVENT</div>
<!-- style="display:inline;border-style:groove;" -->
<div id="event1" class="dragsource" title ="event" >
<p id="targetMsg" style="display:none">event1</p>
<h>event1</h>
</div>
<div id="event2" class="dragsource" title ="event" >
<p id="targetMsg" style="display:none">event2</p>
<h>event2</h>
</div>
</div>

<div id="allPeople"  class="captcha_wrap">
<div class="captcha">PEOPLE</div>
<div id="people" class="dragsource" title ="people" >
<p id="targetMsg" style="display:none">people1</p>
<h>people1</h>
</div>
</div>

<div id="allPlace" class="captcha_wrap">
<div class="captcha">PLACE</div>
<div id="place" class="dragsource" title ="place" >
<p id="la" style="display:none">la</p>
<p id="ln" style="display:none">ln</p>
<h>place1</h>
</div>
</div>
</fieldset>

<fieldset>
<div>
<legend>drag here</legend>
<div id="droppable" class="droppable"> 
<p>Can drop! </p>
<form id ="event" class="form" method="post" action="GetEvent">
<fieldset>
<label class="time" >time</label>
<label class="place">place</label>
<label class="people">people</label>
<label class="attched">attched</label>
<input type="submit" value="GO" >
</fieldset>
</form>
</div>
</div>
</fieldset>

<script>
$(function() {
$( ".dragsource" ).draggable({
helper:"clone",
start: function(event,ui) {
$(this).find("p").html("drag to event");
$(this).find("p").fadeIn();
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
	  if($(this).attr("title")=="place")
		  {
		  $("label.place").append(text); 
		  }
	  if($(this).attr("title")=="people")
	  {
	  $("label.people").append(text); 
	  }
	  //$("form#event").append(text); 
	}
$(this).find("p").fadeOut();
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