<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<%
	int size = 0;
	List<Map<String,Object>> oList = (List<Map<String,Object>>)request.getAttribute("oList");
	Map<String,Object> rmap = new HashMap<>();
	if(oList !=null){
		size = oList.size();
		rmap = oList.get(0);
	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리상세</title>
<%@include file="/common/bootstrap.jsp"%>
<script type="text/javascript">
    const orderDelete = () => {
       	const confirmDelete = confirm("정말 삭제하시겠습니까?");
		if (confirmDelete){
			window.location.href="/order/orderDelete?order_num="+<%=rmap.get("ORDER_NUM")%>;
		}
    }
    const orderList = () => {
      	window.location.href="/order/orderList";
    }
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/include/AdminHeader.jsp"%>
	<!-- /header -->
	<div class="container">
		<div class="page-header">
			<h2>주문관리 <small>주문상세</small></h2>
			<hr />
		</div>
		<!-- 주문상세내역 시작 -->
		<div class="form-group">
			<label for="order_info" style="font-weight: bold; font-size: large;">주문정보</label>
			<div class="form-group">
				<label for="order_num">주문번호</label>
				<input type="text" class="form-control" id="order_num" name="order_num" value="<%=rmap.get("ORDER_NUM") %>" readonly>
			</div>
			<div class="form-group">
				<label for="order_date">주문일</label>
				<input type="text" class="form-control" id="order_date" name="order_date" value="<%=rmap.get("ORDER_DATE") %>" readonly>
			</div>
		</div>
		<hr>
		<div class="form-group">
			<label for="product_info" style="font-weight: bold;font-size: large;">제품정보</label>
			<div class="form-group">
				<label for="product_num">제품 번호</label>
				<input type="text" class="form-control" id="product_num" name="order_num" value="<%=rmap.get("PRODUCT_NUM") %>" readonly>
			</div>
			<div class="form-group">
				<label for="product_category">제품 카테고리</label>
				<input type="text" class="form-control" id="product_category" name="product_category" value="<%=rmap.get("PRODUCT_CATEGORY") %>" readonly>
			</div>
			<div class="form-group">
				<label for="product_name">제품명</label>
				<input type="text" class="form-control" id="product_name" name="product_name" value="<%=rmap.get("PRODUCT_NAME") %>" readonly>
			</div>
			<div class="form-group">
				<label for="product_image">제품 이미지</label><br>
				<img src= "<%=rmap.get("PRODUCT_IMAGE") %>" style="width: 30%; height: 30%;">
			</div>
			<div class="form-group">
				<label for="product_color">제품 색상</label>
				<input type="text" class="form-control" id="product_color" name="product_color" value="<%=rmap.get("ORDER_PRODUCT_COLOR") %>" readonly>
			</div>
			<% if(rmap.get("PRODUCT_STORAGE") != null) { %>
				<div class="form-group">
					<label for="product_storage">제품 용량</label>
					<input type="text" class="form-control" id="product_storage" name="product_storage" value="<%=rmap.get("PRODUCT_STORAGE") %>" readonly>
				</div>
				<% } %>
			<div class="form-group">
				<label for="product_price">제품 가격</label>
				<input type="text" class="form-control" id="product_price" name="product_price" value="<%=rmap.get("PRODUCT_PRICE") %>" readonly>
			</div>
			<div class="form-group">
				<label for="orders_product_count">구매 개수</label>
				<input type="text" class="form-control" id="order_product_count" name="order_product_count" value="<%=rmap.get("ORDER_PRODUCT_COUNT") %>" readonly>
			</div>
		</div>
		<hr>
		<div class="form-group">
			<label for="member_info" style="font-weight: bold; font-size: large;">고객정보</label>
			<div class="form-group">
				<label for="member_id">고객 ID</label>
				<input type="text" class="form-control" id="member_id" name="member_name" value="<%=rmap.get("MEMBER_ID") %>" readonly>
			</div>
			<div class="form-group">
				<label for="member_name">고객 성함</label>
				<input type="text" class="form-control" id="member_name" name="member_name" value="<%=rmap.get("MEMBER_NAME") %>" readonly>
			</div>
			<div class="form-group">
				<label for="member_phone">고객 전화번호</label>
				<input type="text" class="form-control" id="member_phone" name="member_phone" value="<%=rmap.get("MEMBER_PHONE") %>" readonly>
			</div>
			<div class="form-group">
				<label for="member_address">고객 주소</label>
				<input type="text" class="form-control" id="member_address" name="member_address" value="<%=rmap.get("MEMBER_ADDRESS") %>" readonly>
			</div>
		</div>
		<hr>
		<div class="form-group">
			<label for="pay_info" style="font-weight: bold; font-size: large;">결제정보</label>
			<div class="form-group">
				<label for="pay_method">결제 방법</label>
				<input type="text" class="form-control" id="pay_method" name="pay_method" value="<%=rmap.get("PAY_METHOD") %>" readonly>
			</div>
			<div class="form-group">
				<label for="pay_amount">결제 가격</label>
				<input type="text" class="form-control" id="pay_amount" name="pay_amount" value="<%=rmap.get("PAY_AMOUNT") %>" readonly>
			</div>
		</div>
		<hr>
		<!-- 주문 상세내역 끝 -->
		<div class="detail-link">
			&nbsp;
			<button class="btn btn-warning" onclick="orderDelete()">
				삭제
			</button>
			&nbsp;
			<button class="btn btn-success" onclick="orderList()">
				주문목록
			</button>
		</div>
	</div>
</body>
</html>