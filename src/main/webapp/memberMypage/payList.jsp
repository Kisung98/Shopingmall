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
	width: 90%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
	margin-left: auto;
	margin-right: auto;
	font-weight: bold;
	font-size: 18px;
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
	font-weight: bold;
	font-size: 18px;
}

.rounded-input {
	border: none;
	border-radius: 20px;
	padding: 10px 15px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
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
</style>




<%
List<Map<String, Object>> pList = (List<Map<String, Object>>) request.getAttribute("pList");
%>

</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<div class="content">
		<h1>주문목록</h1>
	</div>

	<hr>



	<table>
		<tr>
			<th>주문번호</th>
			<th></th>
			<th>제품명</th>
			<th>색상</th>
			<th>수량</th>
			<th>금액</th>
			<th>결제날짜</th>
			<th></th>
			<th></th>
		</tr>
		<%
		if (pList != null) {

			for (Map<String, Object> pMap : pList) {
		%>
		<tr>
			<td><%=pMap.get("ORDER_NUM")%></td>
			<td>
				<img src="<%=pMap.get("PRODUCT_IMAGE")%>" style="width: 200px; height: 100px;">
			</td>
			<td><a href="/MemberMypage/payDetail?order_num=<%=pMap.get("ORDER_NUM")%>"><%=pMap.get("PRODUCT_NAME")%></a></td>
			<td><%=pMap.get("ORDER_PRODUCT_COLOR")%></td>
			<td><%=pMap.get("ORDER_PRODUCT_COUNT")%></td>
			<td><%=pMap.get("PAY_AMOUNT")%></td>
			<td><%=pMap.get("ORDER_DATE")%></td>
			<td>
                <% if (pMap.get("REVIEW_NUM") == null) { %>
				
                    <% } else { %>
                        <button type="button" class="btn btn-warning">
                            리뷰완료
                        </button>
                        <% } %>
			</td>
			<td><button class="rounded-button" type="button" onclick="location.href='/MemberMypage/payDetail?order_num=<%=pMap.get("ORDER_NUM")%>'">상세보기</button></td>
		</tr>
		<%
		} //end of for

		} //end of if
		else {
		%>
		<tr>
			<td colspan="9">조회결과가 없습니다.</td>
		</tr>
		<%
		}
		%>
	</table>
	<hr>
	</h3>

	<script>
		
	</script>


</body>

</html>