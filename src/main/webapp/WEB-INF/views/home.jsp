<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Monopoly Game
</h1>

<h2 style="color:blue;"> Log in </h2>
<form action='/Monopoly/login' method="POST">
    	User: <input type="text" name="username" /><br/>
        Password: <input type="password" name="password" /><br/>
        <input type="submit" value="Log in" /><br/>
</form>

<div align="right">
	<h2 style="color:green;"> Sign up </h2>
	<form action='/Monopoly/signup' method="POST">
	    	User: <input type="text" name="username" /><br/>
	        Password: <input type="password" name="password" /><br/>
	        E-mail: <input type="text" name="email" /><br/>
	        <input type="submit" value="Sign up" /><br/>
	</form>
</div>

</body>
</html>
