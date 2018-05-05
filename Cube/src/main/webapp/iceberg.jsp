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
<select name="dp1" id="dropdown1"></select>
<select name="dp2" id="dropdown2"></select>
<input type="text" id="threshold"></input>
<input type="submit" id="submit_btn"></input>
<script src="jquery-3.3.1.min.js"></script>

<script>
$(document).ready(function(){
	var temp="<%=dbName%>";
	console.log(temp);
	var uri="webapi/webservice/getaggregates/"+temp;
	console.log(uri);
$.ajax({ 
		   type: "GET",
		   dataType: "json",
		   url: uri,
		   success: function(data){
			   var str1='';
			   var str2='';
			   str1 +='<option value="default">Select a Aggregate</option>';
			   for(var i=0;i<data.length;i++){
				   str1 +=' <option value='+data[i].dim1+'>'+data[i].dim1+'</option>';
			   }
			   document.getElementById("dropdown1").innerHTML = str1;
		   },error: function(e) {
		        console.log("Fail");
		    }
				});
	var uri1="webapi/webservice/facts/"+temp;
$.ajax({ 
	   type: "GET",
	   dataType: "json",
	   url: uri1,
	   success: function(data){
		   var str1='';
		   var str2='';
		   str1 +='<option value="default">Select a Fact</option>';
		   for(var i=0;i<data.length;i++){
			   str1 +=' <option value='+data[i].dim1+'>'+data[i].dim1+'</option>';
		   }
		   document.getElementById("dropdown2").innerHTML = str1;
	   },error: function(e) {
	        console.log("Fail");
	    }
			});
			   
});
$("#submit_btn").click(function(){
	var temp="<%=dbName%>";
	console.log(temp);
	var agg=document.getElementById("dropdown1").value;
	var fact=document.getElementById("dropdown2").value;
	console.log(agg);
	console.log(fact);
	var thres=document.getElementById("threshold").value;
	console.log(thres);
	var uri="webapi/webservice/iceberg/"+temp+'/'+agg+'/'+thres+'/'+fact;
	console.log(uri);
	$.ajax({
		type: "POST",
		dataType: "text",
		url: uri,
		success: function(data){
			console.log("YES");
		},
		error: function(e){
			console.log(e.message);
		}
	});
});
</script>
</body>
</html>