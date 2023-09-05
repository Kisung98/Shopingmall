<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #ffffff;
	margin: 0;
	padding: 0;
	
}

.container {
	max-width: 500px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fdfdd2;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="date"],
	input[type="password"] {
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #e3dac9;
	color: #010000;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #e3dac9;
}

input[type="button"] {
	background-color: #e3dac9;
	color: #000000;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="button"]:hover {
	background-color: #edd09b;
}
.rounded-button {
	background-color: #e3dac9;
	color: #000000;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 18px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-button:hover {
	background-color: #edd09b;
}

.content {
	margin-left: 100px;
    padding: auto;
}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document
				.getElementById("address_kakao")
				.addEventListener(
						"click",
						function() {
							//주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) {
											//선택시 입력값 세팅
											document
													.getElementById("address_kakao").value = data.address; // 주소 넣기
											//document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
										},
									}).open();
						});
	};
</script>



</head>

<body>
	<%@include file="/include/header.jsp"%>

	<div class="container" style="margin-top: 50px">
		<h1>회원정보수정</h1>

		<form action="/MemberMypage/updateMember">

			<!--삽입-->
			<input type="hidden" name="member_num" value="<%=member.get("MEMBER_NUM")%>">

			<label for="username">이름: <%=member.get("MEMBER_NAME")%>
			</label> <br> <label for="name">아이디: <%=member.get("MEMBER_ID")%>
			</label> <br>

			<!--삽입-->
			<label for="password">변경할 비밀번호</label>
			<input type="password" id="member_pw" name="member_pw" placeholder="6자이상" required value="<%=member.get("MEMBER_PW")%>" />

			<!--삽입-->
			<label for="email">변경할 이메일</label>
			<input type="email" name="member_email" placeholder="ex)aaa@naver.com" value="<%=member.get("MEMBER_EMAIL")%>" required />

			<!--삽입-->
			<label for="phone">변경할 핸드폰번호</label>
			<input type="tel" name="member_phone" value="<%=member.get("MEMBER_PHONE")%>" required />


             
			<!--삽입-->
			<label for="address">변경할주소</label>
			<input type="text" id="address_kakao" name="member_address" readonly />

			<!--삽입-->
			<label for="address">현재주소확인 및 변경할 상세주소입력</label>
			<input type="text" value="<%=member.get("MEMBER_ADDRESS")%>" id="member_addressdetail" name="member_addressdetail" required />

			<input type="button" value="변경완료" class="rounded-button" onclick="location.href='../memberMypage/memberUpdate.jsp">
			<br>

		</form>
	</div>
	<br>
	<hr>
	<br>
	<input type="submit" style="display: block; margin: 0 auto;" id="submit" value="회원탈퇴" onclick="deleteMember()" />
	<br>
	

	<!-- jQuery 라이브러리를 HTML에 추가해야 합니다. -->
	<!-- jQuery를 사용하기 위해 아래 스크립트 태그를 추가합니다. -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



	<script>
	
	
function deleteMember() {
    // 확인 창 띄우기
    if (confirm("탈퇴하시겠습니까?")) {
       location.href = '/MemberMypage/deleteMember?member_num=<%=member.get("MEMBER_NUM")%>'; // 여기에 삭제 컨트롤러의 URL을 넣어주세요
    } else {
       window.close();
    }
}


</script>


	<script>
		// form 제출 시 폼 유효성 검사 함수
		function validateForm(event) {
			var username = $("#member_id").val();
			var password = $("#member_pw").val();

			//  비밀번호 길이 검사
			if (password.length < 6) {
				alert("비밀번호는 6자 이상이어야 합니다.");
				event.preventDefault(); // 폼의 기본 동작 방지
				return false;
			}

			// 폼 제출
			return true;
		}
	</script>


</body>
</html>