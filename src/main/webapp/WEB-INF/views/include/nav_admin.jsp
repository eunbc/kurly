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
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
    <style>
		nav {
			position: sticky;
			top : 0;
			left: 0;
			right: 0;
			z-index:3;
			border-bottom: 2px solid #F8F8F8;   
			background-color: #5F0080; 
		}
		.topMenu_icon a {
			text-decoration:none;
			color: white;
		    display: inline-block;                          
		    width: 50px;    
		}

        #container {            
            height: 55px; 
            width: 1100px; 
            border: none;
            margin: 0 auto;
        }
		#container ul{margin:0 auto;}
		#container ul,li {list-style:none; margin:0; padding:0;}
		ul.myMenu > li {
			text-align: center;
            float: left;                
            line-height: 50px;       
            vertical-align: middle;     
            position : relative;    
		}
		ul.myMenu > li a {
            width: 150px;                            
            display: inline-block;                          
            border : none;                           
            text-decoration:none;                    
            color: white;                        
            font-size: 15px;                           
            font-weight: bold;                       
		}
		ul.myMenu > li a:hover {
            color: yellow;  
            text-decoration: underline;
        }
		ul.myMenu > li ul.submenu {display:none; position:absolute; border: 2px solid #F7F7F7;}
		ul.myMenu > li ul.submenu > li {
			text-align: left;
            float: left;                
            line-height: 50px;        
            vertical-align: middle;    
		}
		ul.myMenu > li ul.submenu > li a{
			padding: 0 0 0 10px;
            width: 150px;                            
            display: inline-block;                          
            /*border : 1px solid black; */                          
            text-decoration:none;                    
            color: black;                        
            font-size: 15px;                           
            font-weight: bold;  
            background-color: white;                     
		}
		ul.myMenu > li ul.submenu > li a:hover{
			background-color: #F7F7F7;
			color: #5F0080;
		}
		ul.myMenu > li:hover ul.submenu{  
			display: block;
		}		
		.icon{
			padding: 7px;
		}
    </style>
</head>

<nav>
	<!-- Nav Bar Start -->
	<div id="container"> 
		<ul class="myMenu">
			<li class="icon"><a href="${contextPath}/admin/main"><i class="xi-home xi-2x"></i></a></li>
			<li class="menu1"><a href="${contextPath}/admin/memberList" class="menuLink">회원관리</a>
				<ul class="menu2_s submenu">
					<li><a href="${contextPath}/admin/memberList">회원목록</a></li>
					<li><a href="${contextPath}/admin/coupon">쿠폰지급</a></li>
				</ul>
			</li>
			<li class="menu2"><a href="${contextPath}/admin/goodsList" class="menuLink">상품관리</a>
				<ul class="menu2_s submenu">
					<li><a href="${contextPath}/admin/goods">상품등록</a></li>
					<li><a href="${contextPath}/admin/goodsList">상품목록</a></li>
					<li><a href="${contextPath}/admin/category">대분류관리</a></li>
					<li><a href="${contextPath}/admin/subcategory">중분류관리</a></li>
				</ul>
			</li>
			<li class="menu3"><a href="${contextPath}/admin/orderList" class="menuLink">주문관리</a>
				<ul class="menu2_s submenu">
					<li><a href="${contextPath}/admin/orderList">주문관리</a></li>
					<li><a href="${contextPath}/admin/refund">환불요청</a></li>
				</ul>
			</li>
			<li class="menu4"><a href="${contextPath}/admin/inquiry" class="menuLink">문의관리</a>
				<ul class="menu2_s submenu">
					<li><a href="${contextPath}/admin/inquiry">1:1문의</a></li>
					<li><a href="${contextPath}/admin/qna">상품문의</a></li>
					<li><a href="${contextPath}/admin/review">후기관리</a></li>
				</ul>
			</li>
			<li class="menu5"><a href="${contextPath}/admin/chart" class="menuLink"></a></li>
			<li class="icon"><a href="${contextPath}/h" class="menuLink"><i class="xi-share xi-2x"></i></a></li>
		</ul> 
	</div>
	<!-- Nav Bar End -->
</nav>
</html>