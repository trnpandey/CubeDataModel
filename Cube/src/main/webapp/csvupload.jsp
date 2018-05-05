<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%! String dbName;
%>
<% 
dbName=(String)session.getAttribute("dbaname");
//dbName=request.getParameter("dbaname");
//session.setAttribute("dbaname",dbName);
%>
<body>
<center><input id="fileupload" type="file"></input></center>
<center><input id="btn" type="submit"></input></center>
<center><a href="index.jsp">Go Home</a></center>
</body>
<script src="jquery-3.3.1.min.js"></script>
<script>
$("#btn").click(function(){
	var fullPath = document.getElementById('fileupload').value;
	//console.log(fullPath.lastIndexOf("h"));
	var temp="<%=dbName%>";
	console.log(temp);
	
	fullPath=fullPath.substring(fullPath.lastIndexOf("h")+2,fullPath.length);
	console.log(fullPath);
	var uri="webapi/webservice/uploadcsv/"+fullPath+'/'+temp;
	console.log(uri);

	$.ajax({
		type: "POST",
		dataType: "text",
		url: uri,
		success: function(data){
			alert("Data has been dumped");
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