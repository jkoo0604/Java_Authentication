<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>Registration</h3>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<p class="err"><form:errors path="user.*"/></p>
			<p class="err"><c:out value="${error}" /></p>
		</div>
		<div class="row">
			<form:form action="/registration" method="post" modelAttribute="user">
				<div class="col-sm-12">
					<div class="row form-group">
						<div class="col-sm-4">
							<form:label path="email">Email:</form:label>
						</div>
						<div class="col-sm-8">
			        		<form:input path="email"  class="form-control" type="email"/>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-4">
							<form:label path="password">Password:</form:label>
						</div>
						<div class="col-sm-8">
			        		<form:password path="password"  class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-4">
							<form:label path="passwordConfirmation">Confirm Password:</form:label>
						</div>
						<div class="col-sm-8">
			        		<form:password path="passwordConfirmation"  class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<div class="col text-center">
							<input type="submit" value="Register" class="btn btn-dark"/>
						</div>
					</div>
				</div>
			</form:form>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col text-center">
				<a href="/" class="btn btn-outline-dark btn-sm">Back</a>
			</div>
		</div>
	</div>
</body>
</html>