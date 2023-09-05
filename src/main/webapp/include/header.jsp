<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
Map<String, Object> member = null;
	if(session.getAttribute("member")!=null){
		member = (Map<String, Object>) session.getAttribute("member");	
	}
%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@700&display=swap" rel="stylesheet">

<style>
/* 전체영역에서 여백을 없애줌 */
* {
	margin: 0;
	padding: 0;
}
/* ul li태그에 리스트 스타일과 들여쓰기를 없앰 */
ul li {
	list-style: none;
	padding-left: 0px;
}
/* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
a {
	text-decoration: none;
	color: #373737;
}
/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 100%, 높이 70만큼 배경색은 #f9efac, 글자색은 white, 라인높이70px, menu박스 가운데정렬, 글자가운데 정렬 */
#menu {
	font-family: 'Ubuntu', sans-serif;
	font-size: 26px;
	width: 100%;
	height: 100px;
	background: #f9efac;
	color: white;
    line-height: 100px;
    padding-top: 10px; 
    padding-bottom: 10px; 
	margin: 0 auto;
	text-align: center;
	z-index: 2;
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#menu>ul>li {
	float: left;
	width: 140px;
	position: relative;
	padding-left: 20px;
	line-height: 80px;
}

#menu>ul>li>ul {
	width: 140px;
	display: none;
	position: absolute;
	font-size: 18px;
	background: #f8f3d3;
	z-index: 2;
}

#menu>ul>li:hover>ul {
	display: block;
	padding-left: 0px;
}

#menu>ul>li>ul>li:hover {
	background: #cecece;
	transition: ease 1s;
}

#login {
	border-radius: 20px;
	background-color: transparent;
	color: black;
	padding: 5px;
	width: 130px;
	height: 40px;
	float: right;
	margin-top: 5px;
	margin-right: 10px;
	z-index: 2;
}

#login:hover {
	color: rgb(180, 132, 0);
	padding: 5px;
}

</style>


<body>

	<%
	if (member == null) {
	%>
	<!--여기  -->

	<div id="login">
			<button type="button" onclick="location.href='/memberSignIn/MemberSignIn.jsp'" id="login">
				<strong>로그인</strong>
			</button>
		</a>
	</div>
	<%
	} else {
	%>

	<div id="login">
		<%=member.get("MEMBER_ID")%>님
		<a href="/login/logout" id="login-link">
			<button type="submit" id="login" onclick="location.href='/login/logout'">
				<strong>로그아웃</strong>
			</button>
		</a>
	</div>
	<%
	}
	%>
	<div id="menu">
		<ul>
			<li><a href="#">
					<a href="/MemberMainpage/MemberMainpage">
						<img src="/images/headerImage.png" width="150px" height="60px" alt="이미지 설명">
					</a>

				</a></li>
			<li><a href="#">Phone</a>
				<ul>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=애플폰">Apple</a></li>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=삼성폰">Samsung</a></li>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=LG폰">LG</a></li>
				</ul></li>
			<li><a href="#">Tablet</a>
				<ul>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=애플태블릿">Apple</a></li>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=삼성태블릿">Samsung</a></li>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=LG태블릿">LG</a></li>
				</ul></li>
			<li><a href="#">Earphone</a>
				<ul>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=애플이어폰">Apple</a></li>
					<li><a href="/MemberMainpage/MemberHeaderCategory?product_category=삼성이어폰">Samsung</a></li>
				</ul></li>
			<li><a href="#">Board</a>
				<ul>
					<li><a href="/notice/membernoticeList">공지사항</a></li>
					<li><a href="/qna/memberqnaList">QnA 게시판</a></li>
				</ul></li>
				<%
	if(member!=null){
%>					
			<li><a href="#">MyPage</a>
				<ul>
					<li><a href="/memberMypage/myInformation.jsp">내 정보</a></li>
					<li><a href="/MemberMypage/payList?member_num=<%=member.get("MEMBER_NUM")%>">주문목록</a></li>
					<li><a href="/cart/cartList?member_num=<%=member.get("MEMBER_NUM")%>">장바구니</a></li>
<%
	}
%>					
				</ul></li>
		</ul>
	</div>
	<script type="text/javascript">
      //아래 함수는 로그아웃 버튼이 눌렸을 때 호출됨
      	const logout = () => {
      		console.log('11');//출력이 된다면 호출성공했다는 것임
      		//페이지 이동 -> get방식 -> 주소창이 바뀐다
      		location.href="/login/logoutForm.jsp";//세션에 저장된 nickname을 삭제하기 구현
      	}
	</script>
</body>
</html>
<!--  로그인 성공시 세션에 담긴 이름을 출력하고 로그인 성공한 경우이므로 로그아웃 버튼 추가함  -->