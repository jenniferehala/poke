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
<title>Poke Book</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        <h1>PokeBook</h1>
<table minwidth="450" border="2" bordercolor="black">
    <thead>
        <tr>
            <th>Expense</th>
            <th>Vendor</th>
            <th>Amount</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    
        <c:forEach var="i" items="${poke}">
         <tr>
			<td><a href="/poke/${i.id}"><c:out value="${i.expense}"/></a></td>
         	<td><c:out value="${i.vendor}"/></td>
			<td>$<c:out value="${i.amount}"/></td>
			<td><c:out value="${i.description}"/></td>
			<td> 
			
			<a href="/poke/${i.id}/edit">Edit</a>
			<a href="/poke/delete/${i.id}">Delete </a>
			
			</td>
		</tr>
	</c:forEach>
    </tbody>
</table>
        <br>
		<br>
		
		<h2>Track an expense:</h2>
		
		<p>Description must not be blank.</p><br>
		
		<form:form action="/poke" method="post" modelAttribute="newpoke">
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
		
		
		
    </div> 
</body>
</html>
