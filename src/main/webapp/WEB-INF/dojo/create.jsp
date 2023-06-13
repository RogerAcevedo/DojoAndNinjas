<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>CREATE A DOJO:</h1>
		<HR>
		<form:form method="POST" action="/dojo/new" modelAttribute="dojoObj">
			<p>
				Dojo Name:
				<form:input type="text" path="name"/>
				<form:errors path="name" />
			</p>
			
			<p>
				Village:
				<form:input type="text" path="village" />
				<form:errors path="village" />
			</p>
			<button class="btn btn-dark">New Dojo</button>
		</form:form>
	</div>
</body>
</html>