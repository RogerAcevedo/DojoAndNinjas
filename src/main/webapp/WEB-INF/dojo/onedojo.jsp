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
		<h1>ONE DOJO:</h1>
		<h1>Dojo: <c:out value="${ dojo.village }" /> </h1>
		<h2>
			Number of Ninjas:
			<c:out value=" ${ dojo.ninjas.size() }" />
		</h2>
		<table class="table table-warning">
			<thead>
				<th> First Name </th>
				<th> Last Name </th>
				<th> Age </th>
			</thead>
			<tbody>
				<c:forEach var="ninja" items="${ dojo.ninjas }">
				<tr>
					<td> <c:out value="${ ninja.firstName }" /> </td>
					<td> <c:out value="${ ninja.lastName }" /> </td>
					<td> <c:out value="${ ninja.age }" /> </td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<%-- <c:out value="${ dojo.ninjas }" />  --%>
		
	</div>
</body>
</html>