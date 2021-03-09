<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<div class="mypage-box">
	<div class="mypage-content">
		<div class="mypage-content-box" style="margin-left: 20px">
			<p>
				<c:if test="${slevel=='일반'}">
					<span class="level general">일반</span>
				</c:if>
				<c:if test="${slevel=='화이트'}">
					<span class="level white">화이트</span>
				</c:if>
				<c:if test="${slevel=='라벤더'}">
					<span class="level lavendar">라벤더</span>
				</c:if>
				<c:if test="${slevel=='퍼플'}">
					<span class="level purple">퍼플</span>
				</c:if>
				<c:if test="${slevel=='관리자'}">
					<span class="level admin">관리자</span>
				</c:if>
				<b>${sname}</b> 님
			</p>
			
			<p class="mypage-number">
				<a href="">적립 
				<c:if test="${slevel=='일반'}">
					1%
				</c:if>
				<c:if test="${slevel=='화이트'}">
					3%
				</c:if>
				<c:if test="${slevel=='라벤더'}">
					5%
				</c:if>
				<c:if test="${slevel=='퍼플'}">
					10%
				</c:if>
				<c:if test="${slevel=='관리자'}">
					10%
				</c:if>
				</a>
			</p>
			<p><a class="mypage-button">전체등급 보기</a></p>
		</div>
		<div class="mypage-content-box">
			<p>적립금</p>
			<p class="mypage-number"><a href="${contextPath}/mypage/emoney"><fmt:formatNumber type="number" maxFractionDigits="3" value="${currentEmoney}"/>원</a></p>
		</div>
		<div class="mypage-content-box">
			<p>사용 가능 쿠폰</p>
			<p class="mypage-number"><a href="${contextPath}/mypage/coupon">${couponCnt}개</a></p>
		</div>
	</div>
</div>