<%@page import="com.example.demo.BSPageBar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<%
	int size = 0;
	List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("pList");
	if(pList !=null){
		size = pList.size();
	}

    int numPerPage = 9;
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
    <title>상품관리목록</title>
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 아이콘 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* 기존에 작성한 스타일을 모두 제거했습니다. */
    </style>
    <script type="text/javascript">
        const productList = () => {
            location.href="/product/productList";
        }
        const productDetail = (product_num) => {
            location.href="/product/productDetail?product_num="+product_num;
        }
        const productSearch = () => {
            const gubun = document.querySelector('#gubun').value;
            const keyword = document.querySelector('#keyword').value;
            window.location.href="/product/productList?gubun="+gubun+"&keyword="+keyword;
        }
        const searchEnter = (event) => {
            if(window.event.keyCode == 13)
                productSearch();
        }
        const productInsert = () =>{
            window.location.href="/product/productGoInsert";
        }
    </script>
</head>
<body>
    <!-- header -->
    <%@include file="/include/AdminHeader.jsp"%> 
    
    <!-- /header -->
    
    <div class="container mt-5">
        <div class="page-header">
            <h2>상품관리 <small>상품목록</small></h2>
            <hr />
        </div>
        <!-- 검색기 시작 -->
        <div class="row">
            <div class="col-1">
                <select id="gubun" class="form-select" aria-label="분류선택">
                    <!--<option value="none">분류선택</option>-->
                    <option value="product_name">상품명</option>
                    <!-- <option value="member_id">상품번호</option> -->
                </select>           
            </div>
            <div class="col-6">
                <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
                    aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
            </div>
            <div class="col-3">
                <button id="btn_search" class="btn btn-danger" onClick="productSearch()">검색</button>
            </div>
        </div>      
        <!-- 검색기 끝 -->
        <hr/>
        <!-- 상품목록 시작 -->
        <div class="row">
            <%
            for(int i=nowPage * numPerPage;i<(nowPage * numPerPage) + numPerPage;i++){
                if(size == i) break;
                Map<String,Object> rmap = pList.get(i);
            %>                
				<div class="col-md-4 mb-3">
					<div class="card" onclick="productDetail('<%=rmap.get("PRODUCT_NUM")%>')">
						<div class="card-img-top" style="width: 100%; height: 200px; background-image: url('<%=rmap.get("PRODUCT_IMAGE") %>'); background-size: contain; background-repeat: no-repeat; background-position: center;"></div>
						<div class="card-body">
							<h5 class="card-title"><%=rmap.get("PRODUCT_NUM")%>) <%=rmap.get("PRODUCT_NAME")%></h5>
							<p class="card-text">가격: <%=rmap.get("PRODUCT_PRICE")%>원</p>
							<!-- 추가적인 필드들에 대한 카드 내용도 추가 -->
						</div>
					</div>
				</div>
            <% } %>
        </div>      
        <!-- 상품목록 끝 -->
        <div style="display: flex; justify-content: center;">
            <ul class="pagination">
                <%
                String pagePath = "/product/productList";
                BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
                out.print(bspb.getPageBar());
                %>
            </ul>
        </div>

        <div class='product-footer'>
            <button class="btn btn-primary" onclick="productInsert()">상품 추가</button> 
            <button class="btn btn-warning" onclick="productList()">전체조회</button> 
        </div>
    </div>
    <!-- 부트스트랩 JS 스크립트 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>