<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>Login</h3>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<p class="err"><c:out value="${error}" /></p>
		</div>
		<div class="row">
		    <form method="post" action="/login">
		        <div class="row form-group">
		        	<div class="col-sm-4">
						<label for="email">Email</label>
					</div>
					<div class="col-sm-8">
		        		<input type="email" id="email" name="email" class="form-control"/>
					</div>
		        </div>
		        <div class="row form-group">
		        	<div class="col-sm-4">
						<label for="password">Password</label>
					</div>
					<div class="col-sm-8">
		        		<input type="password" id="password" name="password" class="form-control"/>
					</div>
		        </div>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        <input type="submit" value="Login" class="btn btn-dark btn-sm"/>
		    </form>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col text-center">
				<a href="/registration" class="btn btn-outline-dark btn-sm">Register</a>
				<a href="/" class="btn btn-outline-dark btn-sm">Back</a>
			</div>
		</div>
	</div>
</body>
</html>