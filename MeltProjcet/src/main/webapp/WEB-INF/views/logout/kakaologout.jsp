<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
<script type="text/javascript">

function TTT()
    {
		var url = "https://developers.kakao.com/logout";
        var open = window.open(url);
        open.open();
         setTimeout(function(){
             open.close();
             lo();
             },300)
             
        
        
    }

function lo()
{
    var url = "http://203.233.199.149:8089/melt";
    location.replace(url);
}

setTimeout(function()
{	
	TTT();
},1000);

</script>

</head>
<body>
    logout......
    
    
</body>
</html>