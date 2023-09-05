<%@page import="com.example.demo.BSPageBar"%>
<%@page import="com.example.demo.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" href="../css/memberList.css">   서블릿한테 포워딩을 당하면 외부 css가 꺠져버린다. -->
<style>
table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: left;
	background-color: #f7f7f7;
	color: #333;
}

th {
	background-color: #B6CFB6;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

.rounded-input {
	border: none;
	border-radius: 20px;
	padding: 10px 15px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.rounded-submit {
	background-color: #ff4081;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-submit:hover {
	background-color: #e6005c;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: (footer높이);
}

.footer {
	height: (footer높이);
	position: relative;
	transform: translateY(-100%);
}
</style>




<%
//스크립틀릿 - 지변, 메소드선언 불가함, 인스턴스화 가능함
int size = 0;//지변이니까 초기화를 생략하면 에러발생함.
List<MemberVo> mList = (List<MemberVo>) request.getAttribute("mList");
if (mList != null)
{
	size = mList.size(); //4
}
int numPerPage = 5;
int nowPage = 0;
if (request.getParameter("nowPage") != null)
{
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
%>



</head>

<body>
<%@include file="/include/AdminHeader.jsp"%>


	<br>
	<br>
	<br>
	<h1>회원목록</h1>

	<form action="/member/memberSearch" style="display: inline;">
		<input type="text" class="rounded-input" placeholder="이름입력" name="member_name">
		<input type="submit" value="검색" class="rounded-submit">
	</form>

	<input type="button" value="전체조회" class="rounded-submit" onclick="location.href='/member/memberList';">
	<hr>



	<table>
		<tr>
			<th width="70px">번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>생년월일</th>
			<th>주소</th>
			<th width="70px">권한</th>
		</tr>
		
		<%
		for (int i = nowPage * numPerPage; i < (nowPage * numPerPage) + numPerPage; i++)
		{
			if (size == i)
				break;
			MemberVo mVo = mList.get(i);
		%>

		<tr>
			<td width="70px">
				<%=mVo.getMember_num()%></td>
			<td><%=mVo.getMember_name()%></td>	
			<td><%=mVo.getMember_id()%></td>
			<td><%=mVo.getMember_pw()%></td>
			<td><%=mVo.getMember_email()%></td>
			<td><%=mVo.getMember_phone()%></td>
			<td><%=mVo.getMember_birth()%></td>
			<td><%=mVo.getMember_address()%></td>
			<td><%=mVo.getMember_auth()%></td>
		</tr>
		<%
		} //end of for
		%>

	</table>
	<!-- [[ Bootstrap 페이징 처리  구간 3 ]] -->
	<div style="display: flex; justify-content: center;">
		<ul class="pagination">
			<%
			String pagePath = "/member/memberList";
			BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
			out.print(bspb.getPageBar());
			%>
		</ul>
	</div>



</body>

</html>