<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><input id="fileupload" type="file"></input></center>
<center><input id="btn" type="submit"></input></center>
<button type="button" name="back" onclick="history.back()">back</button>
</body>
<script src="jquery-3.3.1.min.js"></script>
<script>
$("#btn").click(function(){
	var fullPath = document.getElementById('fileupload').value;
	//console.log(fullPath.lastIndexOf("h"));
	fullPath=fullPath.substring(fullPath.lastIndexOf("h")+2,fullPath.length);
	//console.log(fullPath);
	var uri="webapi/webservice/uploadxml/"+fullPath;
	console.log(uri);

	//window.location="index.jsp";
	$.ajax({
		type: "POST",
		dataType: "text",
		url: uri,
		success: function(data){
			alert("XMl File has been parsed");
			window.location="index.jsp";
			console.log("YES");
		},
		error: function(e){
			console.log(e.message);
		}
	});
});
</script>
</html>