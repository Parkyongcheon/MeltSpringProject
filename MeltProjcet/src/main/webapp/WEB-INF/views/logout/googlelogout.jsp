<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
<script>

setTimeout(function()
{	
	logout();
},1000);



function logout()
{
	var url = "https://accounts.google.com/logout";
    var open = window.open(url);
    open.open();
     setTimeout(function(){
         open.close();
         lo();
         },300)
         
    
    
}

function lo()
{
var url = "http://localhost:8089/melt";
location.replace(url);
}


</script>
</head>
<body>
    logout......
    
    
</body>
</html>