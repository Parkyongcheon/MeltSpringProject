<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>

<script>
$(function(){
	$("#one").on('click', one);
	$("#two").on('click', two);
	$("#three").on('click', three);
	
})

function one()
{
	var settings = {
			"async": true

		,
			"crossDomain": true,
			"url": "https://macgyverapi-music-graph-v1.p.rapidapi.com/",
			"method": "POST",
			"headers": {
				"x-rapidapi-host": "macgyverapi-music-graph-v1.p.rapidapi.com",
				"x-rapidapi-key": "bfb2d96c42msh223ece5b6263c61p14e1b6jsnbe46d68dd8a4",
				"content-type": "application/json",
				"accept": "application/json"
			},
			"processData": false,
			"data": "{    \"key\": \"free\",    \"id\": \"9m9c8U4f\",    \"data\": {        \"search\": \"4walls\"    }}"
		}

		$.ajax(settings).done(function (response) {
			console.log(response);
		});
}

function two() 
{
	var settings = {
			"async": true,
			"crossDomain": true,
			"url": "https://getvideo.p.rapidapi.com/?url=https://youtu.be/n6cW6dt7xMc",
			"method": "GET",
			"headers": {
				"x-rapidapi-host": "getvideo.p.rapidapi.com",
				"x-rapidapi-key": "bfb2d96c42msh223ece5b6263c61p14e1b6jsnbe46d68dd8a4"
			}
		}

		$.ajax(settings).done(function (response) {
			console.log(response);
		});
}

function three()
{
	var text = document.getElementById("youtube").value;
	var text2 = text.substring(6);
	console.log(text);
	console.log(text2);
	//adblock끄고 실행하기
	//sources 복사로 한 embed? 태그로만 가능 url은 적용되지 않음.
	//var link = "<object type='text/html' width='560' height='315' data='//www.youtube.com/embed/ME-4xP5ch8o?amp;autoplay=1' allowFullScreen></object>";
	var link = "<object type='text/html' width='560' height='315' data='"+text2+"?amp;autoplay=1&controls=0' allowFullScreen></object>";
	var flag = true;
	if(flag)
		{
			$("#you").html(link);
			
		}
}


</script>

</head>
<body>

<input type="button" value="one" id="one">
<input type="button" value="two" id="two">
<br>
<input type="text" id="youtube"><input type="button" value="three" id="three">


<hr>

<div id="you">

</div>




</body>
</html>