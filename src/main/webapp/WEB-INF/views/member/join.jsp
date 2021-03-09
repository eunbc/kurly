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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/kurly.css?after">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${contextPath}/resources/js/join.js" async></script>
    <script src="${contextPath}/resources/js/address.js"></script>
	<style>
		#content{margin: 0 auto; width: 620px;}
		tr td:first-child {font-weight:800; width:150px;}
		tr td:nth-child(2) {width: 320px}
		tr td:nth-child(3) {width: 150px}
		tr, td {padding: 7px;}
		.gray {color: gray;}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="content-default">
	<div id="content">
		<p><br/></p>
		<h2 style="text-align: center;font-weight: 900;">회원가입</h2>
		<p style="text-align: right;"><span class="necessary">*</span>필수입력사항</p>
		<hr color="black">
		<form name="joinForm" method="post">
			<table>
				<tr>
					<td>아이디<span class="necessary">*</span></td>
					<td>
						<input type="text" name="mMID" id="mMID" class="form-control" placeholder="4~12자의 영문 소문자/숫자로만 입력"/>
	                    <div class="validation" id="id_check"></div>
					</td>
					<td><input type="button" class="button-outline-join" style="width:140px" value="중복확인" id="idCheck"/></td>
				</tr>
				<tr>
					<td>비밀번호<span class="necessary">*</span></td>
					<td>
						<input type="password" name="mPWD" id="mPWD" class="form-control" placeholder="비밀번호를 입력해주세요"/>
	                    <div class="validation" id="pwd_check"></div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호확인<span class="necessary">*</span></td>
					<td>
						<input type="password" name="pwdCheck" id="pwdCheck" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요"/>
	                    <div class="validation" id="pwd_Recheck"></div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이름<span class="necessary">*</span></td>
					<td><input type="text" name="mNAME" id="mNAME" class="form-control" placeholder="이름을 입력해주세요"/></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일<span class="necessary">*</span></td>
					<td><input type="text" name="mEMAIL" id="mEMAIL" class="form-control" placeholder="예: marketkurly@kurly.com"/></td>
					<td><input type="button" value="중복확인" class="button-outline-join" style="width:140px" id="emailCheck"/></td>
				</tr>
				<tr>
					<td>휴대폰<span class="necessary">*</span></td>
					<td><input type="text" name="mPHONE" id="mPHONE" class="form-control" placeholder="숫자만 입력해주세요"/></td>
					<td></td>
				</tr>
				<tr>
					<td>주소<span class="necessary">*</span></td>
					<td>
						<input type="button" onclick="sample6_execDaumPostcode()" id="address" style="width:304;text-align: center;" class="button-outline" value="주소 검색"/>
						<span class="myAddress">
							<input type="text" id="sample6_postcode" name="address1" placeholder="우편번호" class="form-control">
							<input type="text" id="sample6_address" name="address2" placeholder="주소" class="form-control"><br>
							<input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소" class="form-control">
							<input type="text" id="sample6_extraAddress" name="address4" placeholder="참고항목" class="form-control">
							<input type="hidden" name="mADDRESS" id="mADDRESS"/>
						</span>
						<p style="font-size: 12px">배송지에 따라 상품 정보가 달라질 수 있습니다.</p>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" value="남자" name="mGENDER" />&nbsp;남자 &nbsp;
						<input type="radio" value="여자" name="mGENDER" />&nbsp;여자 &nbsp;
						<input type="radio" value="-" name="mGENDER" checked />&nbsp;선택안함 
					</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="mBDAY" id="mBDAY" class="form-control" placeholder="예: 19900207"/></td>
					<td></td>
				</tr>				
				<tr>
					<td>추가입력 사항</td>
					<td>
						<input type="checkbox" class="recommendId" value="추천인 아이디"/>&nbsp;추천인 아이디
						<span id="recommendId">
							<input type="text" name="recommendId" id="strrecommendId" class="form-control" placeholder="추천인 아이디"/>
							<input type="button" class="button-outline-small" id="recommendIdCheck" value="확인"/>
						</span> 
						<script>
						    $(".recommendId").on('click', recommendId)
						    
						    function recommendId(){
							    var check = $('input:checkbox[class="recommendId"]').is(':checked');
								if(check){
							        $("#recommendId").show();
								} else if(!check) {
							        $("#recommendId").hide();
								}
						    }
						    
						    $("#recommendIdCheck").click(function() {
						    	if($("#strrecommendId").val().trim() == "") {
						    		alert("추천인 아이디를 입력하세요");
						    		return false;
						    	}
						    	
						    	var query = { recommendId : $("#strrecommendId").val() }
						    	
						    	$.ajax({
						    		url : '${contextPath}/member/recommendIdCheck',
						    		type : "post",
						    		data : query,
						    		success : function(data) {
						    			if(data == "1") {
						    				alert("확인되었습니다.");
						    			}
						    			else {
						    			 	alert("확인되지 않은 정보입니다.");
						    			}
						    		}
						    	});
						    });
						</script>
					</td>
					<td></td>
				</tr>
			</table>
			<hr color="black"/>
			<table>
				<tr>
					<td>이용약관동의<span class="necessary">*</span></td>
					<td><input type="checkbox" id="termsCheckALl" />&nbsp;<b>전체 동의합니다</b></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" class="terms" id="necessary1" />&nbsp;이용약관 동의<span class="gray">(필수)</span></td>
					<td><a href="" class="terms">약관보기></a></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" class="terms" id="necessary2"/>&nbsp;개인정보처리방침 동의<span class="gray">(필수)</span></td>
					<td><a href="" class="terms">약관보기></a></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="checkbox" class="terms" id="mRECEIVEADChkbox"/>&nbsp;할인쿠폰 등 혜택/정보 수신 동의<span class="gray">(선택)</span>
						<input type="hidden" name="mRECEIVEAD" id="mRECEIVEAD"/>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" class="terms" id="necessary3"/>&nbsp;본인은 만 14세 이상입니다.<span class="gray">(필수)</span></td>
					<td></td>
				</tr>
			</table>
			<hr/>
			<p><br/></p>
			<div style="text-align: center;">
				<input type="button" id="fCheck" value="가입하기" class="button" />
			</div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>