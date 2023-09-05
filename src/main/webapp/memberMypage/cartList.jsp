<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
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
List<Map<String, Object>> cList = (List<Map<String, Object>>) request.getAttribute("cList");
%>

</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<div class="content">
		<h1>장바구니</h1>
	</div>

	<hr>



	<table>
		<tr>
			<th style="width: 100PX;">번호</th>
			<th style="width: 100PX;"></th>
			<th>제품명</th>
			<th>색상</th>
			<th>용량</th>
			<th>수량</th>
			<th>가격</th>
			<th></th>
		</tr>
		<%int price_amount = 0; %>
		<%
		if (cList != null)
		{
			
			for (Map<String, Object> cMap : cList)
			{    
			int p_price = 0;
			int cp_count= 0;
			if(cMap.get("PRODUCT_PRICE")!=null){
				p_price = Integer.parseInt(cMap.get("PRODUCT_PRICE").toString());
			}
			if(cMap.get("CART_COUNT")!=null){
				cp_count = Integer.parseInt(cMap.get("CART_COUNT").toString());
			}
			int product_amount = p_price*cp_count;
			price_amount = price_amount+product_amount;
			
			
		%>
		<tr>
			<td><%=cMap.get("CART_NUM")%></td>
			<td style="width: 100px;">
				<img src="<%=cMap.get("PRODUCT_IMAGE")%>" style="width: 100px; height: auto;">
			</td>
			<td><%=cMap.get("PRODUCT_NAME")%></td>
			<td><%=cMap.get("CART_COLOR")%></td>
			<td><%=cMap.get("PRODUCT_STORAGE")%></td>
			<td><%=cMap.get("CART_COUNT")%></td>             
			<td><%=product_amount%>원</td>
			<td>
				<button class="rounded-button" onclick="location.href='/cart/cartDelete?cart_num=<%=cMap.get("CART_NUM")%>&cart_member_num=<%=member.get("MEMBER_NUM")%>'" type="button">삭제</button>
			</td>
		</tr>
		<%
		} //end of for
			
			
		} //end of if
		else
		{
		%>
		<tr>
			<td colspan="9">조회결과가 없습니다.</td>
		</tr>
		<%
		}
		%>
	</table>
	<hr>
	<h3 style="margin-left: 1500px;">총결제금액: <%=price_amount%>원</h3>
	<button class="rounded-button" type="button" style="margin-left: 1700px;" onclick="location.href='/payment/doPayment?member_num=<%=member.get("MEMBER_NUM")%>'">결제</button>

<script>
</script>
</body>

</html>