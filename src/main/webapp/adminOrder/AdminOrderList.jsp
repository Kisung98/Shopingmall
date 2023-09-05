<%@page import="com.example.demo.BSPageBar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<%
	int size = 0;
	List<Map<String,Object>> oList = (List<Map<String,Object>>)request.getAttribute("oList");
	if(oList !=null){
		size = oList.size();
	}
	int numPerPage = 10;
    int nowPage = 0;
    if (request.getParameter("nowPage") != null)
    {
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리목록</title>
<%@include file="/common/bootstrap.jsp"%>
<script type="text/javascript">
	const orderList = () => {
		location.href="/order/orderList";
	}
	const orderDetail = (order_num) => {
        location.href="/order/orderDetail?order_num="+order_num;
    }
    const orderSearch = () => {
        const gubun = document.querySelector('#gubun').value;
        const keyword = document.querySelector('#keyword').value;
        	window.location.href="/order/orderList?gubun="+gubun+"&keyword="+keyword;
    }
    const searchEnter = (event) => {
        if(window.event.keyCode == 13)
            orderSearch();
    }
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/include/AdminHeader.jsp"%>
	<!-- /header -->
	<div class="container">
		<div class="page-header">
			<h2>주문관리 <small>주문목록</small></h2>
			<hr />
		</div>
		<!-- 검색기 시작 -->
		<div class="row">
			<div class="col-3">
		    	<select id="gubun" class="form-select" aria-label="분류선택">
		      		<!--<option value="none">분류선택</option>-->
		      		<!-- <option value="product_name">제품명</option> -->
		      		<option value="member_id">주문자ID</option>
		    	</select>			
		  	</div>
			<div class="col-6">
		 		<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
		           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
			</div>
			<div class="col-3">
		 		<button id="btn_search" class="btn btn-danger" onClick="orderSearch()">검색</button>
		 	</div>
		</div>		
		<!-- 검색기 끝 -->
		
		<!-- 주문목록 시작 -->
		<div class='order-list'>
			<table class="table table-hover">
		    	<thead>
		      		<tr>	
		        		<th width="10%">주문번호</th>
		        		<th width="20%">주문자ID</th>
						<th width="20"></th>
		        		<th width="20%">제품명</th>
		        		<th width="10%">주문갯수</th>
		        		<th width="20%">주문가격</th>
		        		<th width="40%">주문날짜</th>
		      		</tr>
		    	</thead>
		    	<tbody>
<%
	for(int i=nowPage * numPerPage;i<(nowPage * numPerPage) + numPerPage;i++){
		if(size == i) break;
		Map<String,Object> rmap = oList.get(i);
%>		    	
		      		<tr>
		        		<th><%=rmap.get("ORDER_NUM") %></th>
		        		<th><%=rmap.get("MEMBER_ID") %></th>
		        		<th><img src="<%=rmap.get("PRODUCT_IMAGE") %>" width="100" height="auto"></th>
		        		<th><a href="javascript:orderDetail('<%=rmap.get("ORDER_NUM")%>')"><%=rmap.get("PRODUCT_NAME") %></a></th>
		        		<th><%=rmap.get("ORDER_PRODUCT_COUNT")%></th>
		        		<th><%=rmap.get("PAY_AMOUNT") %></th>
		        		<th><%=rmap.get("ORDER_DATE") %></th>
		      		</tr>
<%
	}
%>		      		
		    	</tbody>
			</table> 
			<div style="display: flex; justify-content: center;">
				<ul class="pagination">
					<%
					String pagePath = "/product/productList";
					BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
					out.print(bspb.getPageBar());
					%>
				</ul>
			</div>
<hr />  	  
		  	<div class='order-footer'>
		    	<button class="btn btn-warning" onclick="orderList()">
		      		전체조회
		    	</button>&nbsp; 
		    </div>
		</div>		
		<!-- 주문목록   끝  -->		
		
	</div>
</body>
</html>