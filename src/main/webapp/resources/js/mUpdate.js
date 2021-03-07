
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	
	
	var birthJ = false;
	
	
	var idKey = 0;
	var emailKey = 0;

$(document).ready(function() {

    $("#recommendId").hide();
    $(".myAddress").hide();

    
    $('#mPWD').blur(function() {
        if (pwJ.test($('#mPWD').val())) {
            console.log('true');
            $('#pwd_check').text('');
        } else {
            $('#pwd_check').text('10자 이상 영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합');
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
    
    
    //제출할 때
    $('#fCheck').click(function() {
	  
    	if($('#mPWD').val()=='') {
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
    	else if($('#sample6_address').val()=='') {
    		alert("주소를 입력하세요.");
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

});


