<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>관리자 페이지</title>
<style>
.button-container {
	display: flex;
	justify-content: center;
}

.button {
	display: inline-block;
	padding: 20px 20px;
	margin: 10px;
	border-radius: 50px;
	background-color: #ffca28;
	color: #ffffff;
	font-size: 16px;
	text-decoration: none;
	text-align: center;
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #ffc107;
}
</style>
</head>
<body>
	<h1 style="margin-top: 100px; text-align: center;">관리자 페이지</h1>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="button-container" style="align-content: center;">
		<a href="/member/memberList" style="margin-right: 30px;"class="btn btn-outline-primary">회원관리</a>
		<a href="/notice/noticeList" style="margin-right: 30px;" class="btn btn-outline-primary">공지사항</a>
		<a href="/qna/qnaList" style="margin-right: 30px;" class="btn btn-outline-primary">Q&A</a>
		<a href="/product/productList" style="margin-right: 30px;" class="btn btn-outline-primary">상품관리</a>
		<a href="/order/orderList" style="margin-right: 30px;" class="btn btn-outline-primary">주문관리</a>
	</div>
</body>
</html>
