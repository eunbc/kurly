<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		footer {
    		width: 1100px;
    		margin: 0 auto;
		    padding: 5px 5px 20px 20px;
		    background-color: #FFFFFF;
		}	
	</style>
</head>
<body>
    <footer>
        <img src="${contextPath}/resources/images/footer.JPG" >
    </footer>
</body>
</html>