<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.demo.BSPageBar"%>
<%@page import="java.util.Map"%>
<%@page import="com.example.demo.vo.NoticeVo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
table {
	width: 90%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 12px;
	text-align: left;
	background-color: #f7f7f7;
	color: #333;
}

th {
	background-color: #f9efac;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

.content {
	margin-left: 100px;
	padding: auto;
}

.rounded-input {
	border: none;
	border-radius: 20px;
	padding: 10px 15px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.rounded-submit {
	background-color: #e3dac9;
	color: #000000;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-submit:hover {
	background-color: #edd09b;
}
</style>


<%
//스크립틀릿 - 지변, 메소드선언 불가함, 인스턴스화 가능함
int size = 0;//지변이니까 초기화를 생략하면 에러발생함.
List<Map<String, Object>> qList = (List<Map<String, Object>>) request.getAttribute("qList");
if (qList != null) {
	size = qList.size(); //4
}
int numPerPage = 5;
int nowPage = 0;
if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
%>

<script>
	function needlogin() {
		alert('로그인 시 이용가능');

	}
</script>



</head>

<body>

	<%@include file="/include/header.jsp"%>


	<br>
	<br>
	<br>
	<div class="content">
		<h1>QnA</h1>
		<input type="button" value="새로고침" class="rounded-submit" onclick="location.href='/qna/memberqnaList';">
		<hr>
	</div>


	<table>
		<tr>
			<th style="width: 20%">QnA번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>

		<%
		for (int i = nowPage * numPerPage; i < (nowPage * numPerPage) + numPerPage; i++)
		{
			if (size == i)
				break;
			Map<String, Object> qMap = qList.get(i);
		%>

		<tr>
			<td style="width: 20%">
				<%=qMap.get("QNA_NUM")%>
			</td>



			<%
			if (member != null)
			{
			%>

			<%
			if (qMap.get("REPLY_CONTENT") != null)
			{
			%>
			<td>
				<a href="/qna/memberqnaDetail?qna_num=<%=qMap.get("QNA_NUM")%>" style="text-decoration: underline;"><%=qMap.get("QNA_TITLE")%>[답변완료]
				</a>
			</td>
			<%
			} else
			{
			%>
			<td>
				<a href="/qna/memberqnaDetail?qna_num=<%=qMap.get("QNA_NUM")%>" style="text-decoration: underline;"><%=qMap.get("QNA_TITLE")%></a>
			</td>
			<%
			}
			%>



			<%
			} else
			{
			%>

			<%
			if (qMap.get("REPLY_CONTENT") != null)
			{
			%>
			<td>
				<a href="javascript:void(0);" onclick="needlogin()" style="text-decoration: underline;"><%=qMap.get("QNA_TITLE")%>[답변완료]
				</a>
			</td>
			<%
			} else
			{
			%>
			<td>
				<a href="javascript:void(0);" onclick="needlogin()" style="text-decoration: underline;"><%=qMap.get("QNA_TITLE")%></a>
			</td>
			<%
			}
			%>



			<%
			}
			%>




			<td><%=qMap.get("MEMBER_ID")%></td>
			<td><%=qMap.get("QNA_DATE")%></td>
		</tr>
		<%
		} //end of for
		%>

	</table>
	<p></p>
	<!-- [[ Bootstrap 페이징 처리  구간 3 ]] -->
	<div style="display: flex; justify-content: center;">
		<ul class="pagination">
			<%
			String pagePath = "/qna/memberqnaList";
			BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
			out.print(bspb.getPageBar());
			%>
		</ul>
	</div>



	<hr>
	<button type="button" style="margin-left: 1700px;" class="btn btn-outline-dark" onclick="location.href='/memberQnA/MemberQnAInsert.jsp'">글쓰기</button>
</body>
</html>