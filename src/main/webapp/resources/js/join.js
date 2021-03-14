
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/; 
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{4,12}$/;
	
	var idKey = 0;
	var emailKey = 0;

$(document).ready(function() {

    $("#recommendId").hide();
    $(".myAddress").hide();
	    	
    $('#mMID').blur(function() {
        if (idJ.test($('#mMID').val())) {
            console.log('true');
            $('#id_check').text('');
        } else {
            $('#id_check').text('4~12자의 영문 소문자/숫자로만 입력');
            $('#id_check').css('font-size', '12px');
    		$('#id_check').css('color', 'black');
        }
    });
    
    $('#mPWD').blur(function() {
        if (pwJ.test($('#mPWD').val())) {
            console.log('true');
            $('#pwd_check').text('');
        } else {
            $('#pwd_check').text('4~12자의 영문 소문자/숫자로만 입력');
            $('#pwd_check').css('font-size', '12px');
        }
    });

    //1~2 패스워드 일치 확인
    $('#pwdCheck').blur(function() {
    	if ($('#mPWD').val() != $(this).val()) {
    		$('#pwd_Recheck').text('비밀번호가 일치하지 않습니다.');
    		$('#pwd_Recheck').css('color', 'black');
            $('#pwd_Recheck').css('font-size', '12px');
    	} else {
    		$('#pwd_Recheck').text('');
    	}
    });
    
    //아이디 중복확인    
    $("#idCheck").click(function() {
    	if($("#mMID").val().trim() == "") {
    		alert("아이디를 입력하세요");
    		$("#mMID").focus();
    		return false;
    	}
    	else if($("#mMID").val().length<4) {
    		alert("아이디는 4자 이상만 허용합니다");
    		$("#mMID").focus();
    		return false;
    	}
    	
    	var query = {mMID : $("#mMID").val()}
    	
    	$.ajax({
    		url : "idCheck",
    		type : "get",
    		data : query,
    		success : function(data) {
    			if(data == "1") {
    				alert("이미 사용중인 아이디입니다");
    				$("#mMID").focus();
    			}
    			else {
    			 	alert("사용 가능한 아이디입니다");
    			 	idKey = 1;
    			 	$("#mPWD").focus();
    			}
    		}
    	}); 
    });
    
    //이메일 중복확인    
    $("#emailCheck").click(function() {
    	if($("#mEMAIL").val().trim() == "") {
    		alert("이메일을 입력하세요");
    		$("#mEMAIL").focus();
    		return false;
    	}
    	
    	var query = {mEMAIL : $("#mEMAIL").val()}
    	
    	$.ajax({
    		url : "emailCheck",
    		type : "get",
    		data : query,
    		success : function(data) {
    			if(data == "1") {
    				alert("이미 등록된 이메일입니다. 다시 작성해 주십시요!");
    				$("#mEMAIL").focus();
    			}
    			else {
    			 	alert("사용이 가능합니다");
    			 	emailKey = 1;
    			}
    		}
    	});
    });
    
    //제출할 때
    $('#fCheck').click(function() {
	    
    	if($('#mMID').val()=='') {
    		alert("아이디를 입력하세요.");
    		$('#mMID').focus();
    		return false;
    	}
    	else if($('#mPWD').val()=='') {
    		alert("비밀번호를 입력하세요.");
    		$('#mPWD').focus();
    		return false;
    	}
        else if ($('#mPWD').val() != $('#pwdCheck').val()) {
            alert('비밀번호를 확인하세요.');
            return false;
        }
    	else if($('#mNAME').val()=='') {
    		alert("이름을 입력하세요.");
    		$('#mNAME').focus();
    		return false;
    	}
    	else if($('#mEMAIL').val()=='') {
    		alert("이메일을 입력하세요.");
    		$('#mEMAIL').focus();
    		return false;
    	}
    	else if($('#mPHONE').val()=='') {
    		alert("휴대폰 번호를 입력하세요.");
    		$('#mPHONE').focus();
    		return false;
    	}
    	else if($('#mBDAY').val()=='') {
    		alert("생년월일을 입력하세요.");
    		$('#mBDAY').focus();
    		return false;
    	}
    	else if($('#sample6_address').val()=='') {
    		alert("주소를 입력하세요.");
    		return false;
    	}else if(idKey==0) {
    		alert("아이디를 중복체크 해주세요.");
    		return false;
    	}else if(emailKey==0) {
    		alert("이메일 중복체크 해주세요.");
    		return false;
    	}
    	else if($('#necessary1').is(":checked") == false){
    		alert("이용약관동의(필수)에 체크해주세요.");
    		console.log('모두 체크 안함');
    		return false;
		}
    	else if($('#necessary2').is(":checked") == false){
    		alert("이용약관동의(필수)에 체크해주세요.");
    		console.log('모두 체크 안함');
    		return false;
		}
    	else if($('#necessary3').is(":checked") == false){
    		alert("이용약관동의(필수)에 체크해주세요.");
    		console.log('모두 체크 안함');
    		return false;
		}
        else {
		    var address = $("#sample6_postcode").val()+"@"+$("#sample6_address").val()+"@"+$("#sample6_detailAddress").val()+"@"+$("#sample6_extraAddress").val();
			$('#mADDRESS').val(address);

		    var check = $('input:checkbox[id="mRECEIVEADChkbox"]').is(':checked');
			if(check){
		        $("#mRECEIVEAD").val('Y');
			} else if(!check) {
		        $("#mRECEIVEAD").val('N');
			}
			
			joinForm.submit();
        }
    });

    //체크박스 전체 선택
    $("#termsCheckALl").click(function(){
        if($("#termsCheckALl").prop("checked")){
            $(".terms").prop("checked",true);
        }else{
            $(".terms").prop("checked",false);
        }
    })

    //전체 선택된 상태에서 하나 해제할 때, 전체 선택 해제
    $(".terms").click(function(){
        var check = $('input:checkbox[id="termsCheckALl"]').is(':checked');
    	if(check){
            $("#termsCheckALl").prop("checked",false);
    	}
    });

});


