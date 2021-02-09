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
		#topBar {            
		    height: 25px; 
		    width: 1100px; 
		    /*border: 1px solid black;*/
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
		    line-height: 20px;         /*   글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정 */
		    vertical-align: middle;     /* 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함) */
		    text-align: center;  
		    /*border : 1px solid black;   */                        
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
		#topMenu_icon a {
			text-decoration:none;
			color: black;
		  display: inline-block;                          
		    width: 50px;    
		}
		nav {
			position: sticky;
			top : 0;
			left: 0;
			right: 0;
		}
		
    
    
    
        #topMenu {            
            height: 55px; 
            width: 1100px; 
            border: 1px solid black;
            margin: 0 auto;
        }
        #topMenu ul {
        	margin : 0 auto;
        }
        #topMenu ul li {                     
            list-style: none;         
            color: black;            
            background-color: white;  
            float: left;                
            line-height: 50px;         /*   글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정 */
            vertical-align: middle;     /* 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함) */
            text-align: center;   
            position : relative;    
        }
        #topMenu .menuLink {  
            width: 130px;                            
            display: inline-block;                          
            border : 1px solid black;                           
            text-decoration:none;                    
            color: black;                        
            font-size: 15px;                           
            font-weight: bold;                       
        }
        #topMenu .menuLink:hover {           
            color: #5F0080;  
            text-decoration: underline;
        } 
        .myMenu > li ul.parentCategory {position:absolute;}
        .myMenu > li ul.parentCategory > li  {
        	position:inline-block; 
        	width:170px;
        	border: 1px solid black;
            list-style: none;         
            color: black;            
            background-color: white;  
        	text-align: left;
        }
        .myMenu > li ul.parentCategory > li a{
        	color: black;
        	text-decoration: none;
        }
    </style>
</head>
<body>
<header>
	<!-- Top Bar Start -->
	<div id="topBar">
		<ul>
			<li><a href="${contextPath}/member/join" class="menuLink">고객센터 ▼</a></li>
			<li><a href="${contextPath}/member/login" class="menuLink">로그인</a></li>
			<li><a href="${contextPath}/member/join" class="menuLink" style="color: #5F0080">회원가입</a></li>
		</ul>
	</div>
	
	<div style="text-align: center;">
		<a href="${contextPath}/"><img src="${contextPath}/resources/images/logo.jpg" width="150px"/></a>
	</div>
	<!-- Top Bar End -->
</header>

<nav>
	<!-- Nav Bar Start -->
	<div id="topMenu"> 
		<ul class="myMenu">
			<li class="CategoryAll">
				<a href="${contextPath}/" class="menuLink" style="width: 170px"><i class="xi-bars xi-x">&nbsp;</i>전체 카테고리</a>
				<ul id="parentCategory">
					<li><a href="${contextPath}/shop/productList?category=">채소</a></li>
					<li><a href="${contextPath}/shop/productList?category=">과일·견과·쌀</a></li>
					<li><a href="${contextPath}/shop/productList?category=">수산·해산·건어물</a></li>
					<li><a href="${contextPath}/shop/productList?category=">정육·계란</a></li>
					<li><a href="${contextPath}/shop/productList?category=">국·반찬·메인요리</a></li>
					<li><a href="${contextPath}/shop/productList?category=">샐러드·간편식</a></li>
					<li><a href="${contextPath}/shop/productList?category=">면·양념·오일</a></li>
					<li><a href="${contextPath}/shop/productList?category=">생수·음료·우유·커피</a></li>
					<li><a href="${contextPath}/shop/productList?category=">간식·과자·떡</a></li>
					<li><a href="${contextPath}/shop/productList?category=">베이커리·치즈·델리</a></li>
					<li><a href="${contextPath}/shop/productList?category=">건강식품</a></li>
					<li><a href="${contextPath}/shop/productList?category=">생활용품·리빙</a></li>
					<li><a href="${contextPath}/shop/productList?category=">뷰티·바디케어</a></li>
					<li><a href="${contextPath}/shop/productList?category=">주방용품</a></li>
				</ul>
			</li>
			<li><a href="${contextPath}/" class="menuLink">신상품</a></li>
			<li><a href="${contextPath}/" class="menuLink">베스트</a></li>
			<li><a href="${contextPath}/" class="menuLink">알뜰쇼핑</a></li>
			<li><a href="${contextPath}/" class="menuLink">금주혜택</a></li>
			<li style="line-height: 30px"><input type="text" class="form-control" placeholder="검색" /></li>
		</ul> 
		<div id="topMenu_icon">
			&nbsp;<a href="${contextPath}/" ><i class="xi-search xi-2x"></i></a>
			<a href="${contextPath}/" ><i class="xi-maker xi-2x"></i></a>
			<a href="${contextPath}/" ><i class="xi-cart-o xi-2x"></i></a>
		</div>
	</div>
	<!-- Nav Bar End -->
</nav>
</body>
</html>