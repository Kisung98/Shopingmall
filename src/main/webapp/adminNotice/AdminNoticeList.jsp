<%@page import="com.example.demo.BSPageBar"%>
<%@page import="com.example.demo.vo.NoticeVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
</style>

<%
//스크립틀릿 - 지변, 메소드선언 불가함, 인스턴스화 가능함
int size = 0;//지변이니까 초기화를 생략하면 에러발생함.
List<NoticeVo> nList = (List<NoticeVo>) request.getAttribute("nList");
if (nList != null)
{
	size = nList.size(); //4
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
	<h1>공지사항</h1>

	<form action="/notice/noticeSearch" style="display: inline;">
		<input type="text" class="rounded-input" placeholder="제목입력" name="notice_title">
		<input type="submit" value="검색" class="rounded-submit">
	</form>

	<input type="button" value="전체조회" class="rounded-submit" onclick="location.href='/notice/noticeList';">
	<hr>


	<table>
		<tr>
			<th style="width: 10%">공지번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
		for (int i = nowPage * numPerPage; i < (nowPage * numPerPage) + numPerPage; i++)
		{
			if (size == i)
				break;
			NoticeVo nVo = nList.get(i);
		%>

		<tr>
			<td style="width: 20%">
				<a href="/notice/noticeDetail?notice_num=<%=nVo.getNotice_num()%>" style="text-decoration: underline;"><%=nVo.getNotice_num()%></a>
			</td>

			<td><%=nVo.getNotice_title()%></td>
			<td><%=nVo.getNotice_date()%></td>
			<td><%=nVo.getNotice_count()%></td>
		</tr>
		<%
		} //end of for
		%>

	</table>

	<!-- [[ Bootstrap 페이징 처리  구간 3 ]] -->
	<div style="display: flex; justify-content: center;">
		<ul class="pagination">
			<%
			String pagePath = "/notice/noticeList";
			BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
			out.print(bspb.getPageBar());
			%>
		</ul>
	</div>



	<hr>
	<button type="button" style="margin-left: 1500px;" class="btn btn-outline-success" onclick="location.href='/adminNotice/AdminNoticeInsert.jsp'">글쓰기</button>

</body>

</html>