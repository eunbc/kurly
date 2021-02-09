<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>msg.jsp</title>
	<script>
		var msg = "${msg}";
		var url = "${contextPath}/${url}";
		
		alert(msg);
		if(url != "") location.href = url;
	</script>
</head>
<body>
</body>
</html>