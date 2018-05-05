<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>
</head>
<title>Cube Data Management System</title>
<body>
<%! String dbName;
%>
<% 
if(session.getAttribute("dbaname")==null)
{
	dbName=request.getParameter("dbaname");
	session.setAttribute("dbaname",dbName);
}
else
{
	dbName=(String)session.getAttribute("dbaname");
}
%>
<h1 align="center">Cube Data Management System</h1>
<center><a href="fileupload.jsp"><button id="upload_xml" class="dropbtn">Upload XML File</button></a></center>
<hr>
<center><button id="create_lattice" class="dropbtn" >Create Lattice of Cuboid Schema </button></center>
<hr>
<center><a href="csvupload.jsp"><button id="upload_csv" class="dropbtn" >Upload Data </button></a></center>
<hr>
<center><div class="dropdown">
  <button id="compute_cube" class="dropbtn">Compute Cube</button>
  <div class="dropdown-content">
    <button id="full_cube" class="dropbtn">Full Cube</button>
    <a  href="iceberg.jsp"><button id="ice_berg" class="dropbtn" >Iceberg Cube</button></a>
  </div>
</div>
</center>
<p id="demo"></p>
<script src="jquery-3.3.1.min.js"></script>
<script>
    $("#create_lattice").click(function(){
    	var temp="<%=dbName%>";
    	console.log(temp);
    	var uri="webapi/webservice/computelattice/"+temp;
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
   
    $("#full_cube").click(function(){
    	var temp="<%=dbName%>";
    	console.log(temp);
    	var uri="webapi/webservice/fullcube/"+temp;
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