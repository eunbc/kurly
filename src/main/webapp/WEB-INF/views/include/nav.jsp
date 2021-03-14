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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
    	header {
    		width: 1100px;
    		margin: 0 auto;
    	}
		#topBar {            
		    height: 25px; 
		    width: 1100px; 
		    margin: 0 auto;
		}
		#topBar ul {
			padding-left:0px;
		}
		#topBar ul li {                     
		    list-style: none;         
		    color: black;            
		    background-color: white;  
		    float: right;                
		    line-height: 20px;        
		    vertical-align: middle;    
		    text-align: center;  
		    border-right : 1px solid lightgray;    
		    padding : 0px 5px 0px 10px;
		}
		#topBar ul li:first-child {
			border-right: none;
		}
		#topBar .menuLink {  
		    text-decoration:none;                    
		    color: black;                        
		    display: block;                          
		    width: 60px;                            
		    font-size: 11px;                           
		    font-weight: bold;                       
		}
		nav {
			position: sticky;
			top : 0;
			left: 0;
			right: 0;
			z-index:3;
			border-bottom: 3px solid #F8F8F8;   
			background-color: white; 
		}
		
		#topMenu_icon a {
			text-decoration:none;
			color: black;
		    display: relative;                          
		    width: 50px;   
		    padding: 8px; 
		    top: -10px;
		}

        #container {            
            height: 55px; 
            width: 1100px; 
            margin: 0 auto;
        }
		#container ul,li {list-style:none; margin:0; padding:0;}
		
		
		ul.myMenu > li {
			text-align: center;
            float: left;                
            line-height: 50px;         
            vertical-align: middle;   
            position : relative;    
		}
		ul.myMenu > li a {
            width: 130px;                            
            display: inline-block;                          
            border : 1px solid white;                           
            text-decoration:none;                    
            color: #383838;                        
            font-size: 15px;                           
            font-weight: bold;                       
		}
		ul.myMenu > li a:hover {
            color: #5F0080;  
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
            width: 200px;                            
            display: inline-block;                          
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
		ul.myMenu > li ul.top_submenu {
			z-index: 5;
		}
		
		ul.myMenu > li ul.top_submenu > li a{
			padding: 3px 0 0 3px;
            width: 100px;                            
            display: inline-block;                          
            /*border : 1px solid black; */                          
            text-decoration:none;                    
            color: black;                        
            font-size: 12px;                           
            background-color: white;    
            text-align: left;          
            font-weight: normal;       
		}
		ul.myMenu > li ul.top_submenu > li a:hover{
			background-color: white;
			color: black;
		}    
		.badge-notify {
			background-color: 5F0080;
			color: white;
			font-size: 9px;
		}
		#btnSearch {
			cursor: pointer;
		}
    </style>
    <script>
    	function logout() {
			localStorage.clear();
			location.href='${contextPath}/member/logout';
		}
    </script>
</head>
<header>
	<!-- Top Bar Start -->
	<div id="topBar">
		<ul class="myMenu">
			<li>
				<a href="${contextPath}/board/list" class="menuLink">고객센터 ▼</a>
				<ul class="submenu top_submenu">
					<li><a href="${contextPath}/board/list">공지사항</a></li>
					<li><a href="${contextPath}/faq/list">자주하는 질문</a></li>
					<li><a href="${contextPath}/inquiry/list">1:1 문의</a></li>
				</ul>
			</li>
			<c:if test="${!empty smid}">
				<li>
					<a class="menuLink">
						${sname}님 ▼
					</a>
					<ul class="submenu top_submenu">
						<li><a href="${contextPath}/mypage/order">주문내역</a></li>
						<li><a href="${contextPath}/mypage/wishlist">늘 사는 것</a></li>
						<li><a href="${contextPath}/mypage/review">상품 후기</a></li>
						<li><a href="${contextPath}/mypage/emoney">적립금</a></li>
						<li><a href="${contextPath}/mypage/coupon">쿠폰</a></li>
						<li><a href="${contextPath}/member/update">개인 정보 수정</a></li>
						<li><a href="javascript:logout();">로그아웃</a></li>
						<c:if test="${slevel=='관리자'}">
							<li><a href="${contextPath}/admin/main">관리자</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test="${empty smid}">
				<li><a href="${contextPath}/member/login" class="menuLink">로그인</a></li>
				<li><a href="${contextPath}/member/join" class="menuLink" style="color: #5F0080">회원가입</a></li>
			</c:if>
		</ul>
	</div>
	
	<div style="text-align: center;">
		<a href="${contextPath}/"><img src="${contextPath}/resources/images/logo.jpg" width="150px"/></a>
	</div>
	<!-- Top Bar End -->
</header>

<nav>
	<!-- Nav Bar Start -->
	<div id="container"> 
		<ul class="myMenu">
			<li class="menu1" style="width:170px">
				<a href="${contextPath}/" class="menuLink" style="width: 170px"><i class="xi-bars xi-x">&nbsp;</i>전체 카테고리</a>
				<ul class="menu2_s submenu">
					<li><a href="${contextPath}/goods/goodsList?cCODE=907">채소</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=908">과일·견과·쌀</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=909">수산·해산·건어물</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=910">정육·계란</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=911">국·반찬·메인요리</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=912">샐러드·간편식</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=913">면·양념·오일</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=914">생수·음료·우유·커피</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=915">간식·과자·떡</a></li>
					<li><a href="${contextPath}/goods/goodsList?cCODE=916">베이커리·치즈·델리</a></li>
				</ul>
			</li>
			<li class="menu2"><a href="${contextPath}/goods/goodsNew" class="menuLink">신상품</a></li>
			<li class="menu3"><a href="${contextPath}/goods/goodsBest" class="menuLink">베스트</a></li>
			<li class="menu4"><a href="${contextPath}/goods/goodsOnsale" class="menuLink">알뜰쇼핑</a></li>
			<li class="menu5"><a href="${contextPath}/board/list" class="menuLink">고객센터</a></li>
			<li style="width:220px;margin:8px;"><input type="text" id="strSearch" class="form-control" placeholder="검색" /></li>
		</ul> 
		<div id="topMenu_icon">
			&nbsp;<a id="btnSearch" style="top:-10px;" ><i class="xi-search xi-2x"></i></a>
			<a href="${contextPath}/" style="top:-10px;" ><i class="xi-maker xi-2x"></i></a>
			<a href="${contextPath}/goods/cart" ><i class="xi-cart-o xi-2x"></i><span class="badge badge-notify my-cart-badge" id="my-cart-badge">${scart}</span></a>
		</div>
		<script>
			$(function() {
				$("#btnSearch").click(function(){
					var strSearch = document.getElementById("strSearch").value;
					
					if(strSearch=='') return false;
					location.href='${contextPath}/goods/goodsSearch?strSearch='+strSearch;
				});			
			});
		</script>
	</div>
	<!-- Nav Bar End -->
</nav>
</html>