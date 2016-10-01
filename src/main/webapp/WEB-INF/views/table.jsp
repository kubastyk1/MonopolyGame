<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	
	body {
		font-size: 16px;
	}
	
	.container {
		/*bottom: 1000px;*/
		margin-top: -2.5%;
		float: right;
		width: 27.5%;
	}
	
	.container ul {
	    list-style: none;
	    padding: 0;
	   /* margin: 0 0 20px 0;*/
	}
	
	.dropdown { 
	  position: relative;
	  background: #ECF0F1;
	}
	
	.dropdown a { text-decoration: none; }
	
	.dropdown .dropdown2 {
	    display: block;
		color: #1ABC9C;
	    border: 1px solid #1ABC9C;
	    border-left: 6px solid #1ABC9C;
		padding: 10px; 
	}
	
	.dropdown .dropdown-menu {
		max-height: 0;
		overflow: hidden;
		list-style: none;
		padding: 0;
	  	margin: 0;
	    position: relative;  
	}
	
	.dropdown ul li:hover{
	  background: #1ABC9C;
	  color: white;
	  cursor: pointer;
	}
	
	.dropdown .dropdown2:hover{
	    background: #1ABC9C;
	    color: white;
	    cursor: pointer;
	}
	
	.dropdown .dropdown-menu li {
		padding: 0;
		display: block;
		padding: 10px 10px;
	}
	
	.dropdown input{
	    opacity: 0;
	    display: block;
	    position: absolute;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    cursor: pointer;
	}
	
	.dropdown input:checked ~  .dropdown-menu {
	    max-height: 9999px;
		display: block;
	}
</style>
<script type="text/javascript">
	function changeDescription(playerNumber, username, money){
		document.getElementById("a"+playerNumber).innerHTML = username + "   " + money +"$";
	}
</script>
</head>
<body>

<div class="container">
  <ul>
	<c:forEach items="${playerList.getPlayerList()}" var="i">
		<li class="dropdown">
      		<input id="toggle3" type="checkbox" />
      		<a id="a${i.getPlayerNumber()}" href="#" class="dropdown2">
      		<c:out value="${i.getUsername()}  ${i.getMoney()}$" /></a>
      	  	<ul id="dropdown-menu" class="dropdown-menu">
      	  	
      	  	<!-- 	<c:forEach items="${i.getUserFields()}" var="j">
      	  			<li>HOME</li>
		       		<li><c:out value="${j.getFieldName()}" /></li>
		        </c:forEach>-->
	      	</ul>
    	</li>
	</c:forEach>
 </ul>
</div>

</body>
</html>