<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
<h1>Edit Book</h1>
    <div class="container"> <!-- Beginning of Container -->
        
        <form:form action="/poke/${poke.id}" method="post" modelAttribute="poke">
        <input type="hidden" name="_method" value="put">
        
			<form:label path="expense">Expense Name:</form:label>
			<form:errors path="expense"/>
			<form:input path="expense"/><br><br>
			
			<form:label path="vendor">Vendor Name:</form:label>
			<form:errors path="vendor"/>
			<form:input path="vendor"/><br><br>
			
			<form:label path="amount">Amount:</form:label>
			<form:errors path="amount"/>
			<form:input path="amount"/><br><br>
			
			<form:label path="description">Description:</form:label>
			<form:errors path="description"/>
			<form:textarea path="description"/><br><br>
		
			<input type="submit" value="Submit"/>
		
		</form:form>
		
		<br>
		
		<a href="/poke">Go Back</a>
    </div> <!-- End of Container -->
</body>
</html>
