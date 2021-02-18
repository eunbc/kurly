<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<div class="mypage-box">
	<div class="mypage-content">
		<div class="mypage-content-box" style="margin-left: 20px">
			<p>일반 <b>${sname}</b> 님</p>
			<p class="mypage-number"><a href="">적립 0.5%</a></p>
			<p><a class="mypage-button">전체등급 보기</a></p>
		</div>
		<div class="mypage-content-box">
			<p>적립금</p>
			<p class="mypage-number"><a href="">0원</a></p>
		</div>
		<div class="mypage-content-box">
			<p>쿠폰</p>
			<p class="mypage-number"><a href="">0개</a></p>
		</div>
	</div>
</div>