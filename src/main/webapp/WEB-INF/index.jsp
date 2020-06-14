<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>Welcome, <c:out value="${user.email}"/></h3>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col text-center">
				<a href="/logout" class="btn btn-outline-dark btn-sm">Logout</a>
			</div>
		</div>
	</div>
</body>
</html>