<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/member/signup.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<title>회원가입</title>
</head>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		/* id 중복확인 검증 변수 선언. */
		var idch;
		/* 비밀번호 검증 변수 선언 */
		var pwch;

		/* id 중복확인 */
	   $("input[name='idCheck']").click(function(){
		   var userid = $.trim($("#u_id").val());
		   if(userid == ""){
			   alert("아이디를 입력해 주세요");
			   $("#u_id").focus();
			   return false;
		   }
		   $.ajax({
			   /* 전송 전 세팅 */
			   type : "POST",
			   data : "u_id="+userid,
	           url : "idcheck.do",
	   		   dataType : "text",

	            success: function(result){
	            	if(result == "ok"){
	            		alert("사용 가능한 아이디 입니다.");
	            		idch = "idOK";
	            	}else{
	            		alert("이미 사용중인 아이디 입니다.");
	            	}
	            },
	            error: function(){
	            	alert("오류발생");
	            }
	         })
	   })

 		/* password 검증 */
	   $("#password").keyup(function() {
		   var pass = $.trim($("#password").val());
		   var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

		   if(pass.match(pattern) == null){
			   $("#chValue").text("비밀번호는 영문, 숫자, 특수문자를 1개 이상 포함해주세요 ");
			   pwch = "";
		   }else{
			   $("#chValue").text("비밀번호가 정상적으로 입력되었습니다.");
			   pwch = "pwok";
		   }
		});

		/* 비밀번호 확인 */
	   $("#passchk").keyup(function() {
		   var pass = $.trim($("#password").val());
		   var passck = $.trim($("#passchk").val());

		   if(pwch == "pwok2"){
			   if(pass != passck){
				   $("#chValue").text("비밀번호를 똑같이 입력해 주세요");
				   pwch = "pwok";
			   }
		   }

		   if(pwch != "pwok"){
			   $("#chValue").text("비밀번호를 먼저 입력해 주세요 ");
			   $("#password").focus();
		   }else if( pass == passck ){
			   $("#chValue").text("비밀번호가 정상적으로 입력되었습니다.");
			   pwch = "pwok2";
		   }else{
			   $("#chValue").text("비밀번호를 똑같이 입력해 주세요");
		   }
		});

	   /* 전화번호 하이픈 */
		$("#phone").keyup(function(){
			var phone = $.trim($("#phone").val());

			phone = phone.replace(/[^0-9]/g, '');
			phone = phone.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, '$1-$2-$3');
			phone = phone.replace(/(\-{1,2})$/g, "");

			$("#phone").val(phone);
		})

		/* 주소 검색 */
		$("#addressSearch").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수

	                addr = data.roadAddress;

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zip_code').value = data.zonecode;
	                document.getElementById('address').value = addr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("dAddress").focus();
		        }
		    }).open();
		})


		/* ID 중복확인 검사, 비밀번호 검사 */
	    $("button[name='signUpSubmit']").click(function(){
	    	 if(idch != "idOK"){
	    		 alert("아이디 중복확인을 해주세요.");
	    		 $("#uID").focus();
	             return false;
	    	 }else if(pwch != "pwok2"){
	    		 alert("비밀번호가 조건에 맞는지 확인해 주세요.");
	    		 return false;
	    	 }
		   })
	});

</script>


<body>
	<form name="frm" method="post" action="signupsave.do" id = "frm">
		<h1> Sign up </h1>
		<table >
			<tr>
				<td> <input type="text" id="u_id" name="u_id" class="S_input_text" placeholder="아이디" maxlength="15"/> </td>
			 	<td> <input class="bt_css" type="button"   name="idCheck" value="중복 확인" /></td>
			</tr>
			<tr>
				<td> <input type="password" id="password" name="password" class="S_input_text" placeholder="비밀번호" maxlength="15" /> </td>
				<td><input type="password" id="passchk" name="password_confirm" class="S_input_text" placeholder="비밀번호 확인" maxlength="15"/></td>
			</tr>
			<tr>
				<td colspan="2"> <p id="chValue" style="margin:0;  color: #808080; font-size:8px;" > 비밀번호는 영문, 숫자, 특수문자를 1개 이상 포함해주세요</p> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="name" class="L_input_text" name="name" placeholder="이름" maxlength="15" required /></td>
			</tr>
			<tr>
                <td> <input type="text" id="email" name="email" class="S_input_text"  placeholder="이메일" required /> @</td>
                <td> <select name="domain" id=domain">
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@nate.com">nate.com</option>
					</select>
				</td>
            </tr>
            <tr>
				<td> <input type="text" id="zip_code" name="zip_code" class="S_input_text" placeholder="우편번호" maxlength="15" readonly /> </td>
			 	<td> <input class="bt_css" type="button" value="주소 찾기" id="addressSearch"/> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="address" class="L_input_text" name="address" placeholder="주소"  readonly /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="dAddress" class="L_input_text" name="dAddress" placeholder="상세 주소"   /></td>
			</tr>
			<tr>
                <td colspan="2"> <input type="text" id="phone" name="phone"  class="L_input_text"  placeholder="전화번호" required maxlength="13"  /></td>
            </tr>
			<tr>
				<td id="but_td" colspan="2">
					<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css">회원가입</button>
					<button type="reset" class="bt_css" onclick="location.href='index.do'" >취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>