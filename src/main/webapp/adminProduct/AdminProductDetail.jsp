<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<%
	int pSize = 0;
    int rSize = 0;
	List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("pList");
    List<Map<String,Object>> rList = new ArrayList<>();
	Map<String,Object> rmap = new HashMap<>();
	Map<String,Object> pmap = new HashMap<>();
	if(pList !=null){
		pSize = pList.size();
		rmap = pList.get(0);
        pmap = pList.get(1);
        
        List<Map<String, Object>> reviewList = (List<Map<String, Object>>) pmap.get("product_reivew");
        rList = new ArrayList<>(reviewList);

        rSize = rList.size();
        }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리상세</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
    const productList = () => {
          window.location.href="/product/productList";
    }
    const productUpdate = () =>{
        const confirmUpdate = confirm("수정하시겠습니까?");
        if(confirmUpdate){
            document.querySelector("#f_product").submit();
        }
    }
    const productDelete = () => {
        const confirmDelete = confirm("정말 삭제하시겠습니까?");
        if(confirmDelete){
            window.location.href="/product/productDelete?product_num="+<%=rmap.get("PRODUCT_NUM")%>;
        }
    }
    const displayStars = (grade) => {
        let stars = '';
        for (let j = 0; j < grade; j++) {
            stars += '★';
            }
        return stars;
    };
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/include/AdminHeader.jsp"%>
	<!-- /header -->
	<div class="container">
		<div class="page-header">
			<h2>상품관리 <small>상품상세</small></h2>
			<hr />
		</div>
		<!-- 상품상세내역 시작 -->
        <form id="f_product" method="post" action="/product/productUpdate" enctype="multipart/form-data">
            <div class="form-group">
                <label for="product_num">상품번호</label>
                <input type="text" class="form-control" id="product_num" name="product_num" value="<%=rmap.get("PRODUCT_NUM") %>" readonly>
            </div>
            <div class="form-group">
                <label for="product_category">상품 카테고리</label>
<!--                 <input type="text" class="form-control" id="product_category" name="product_category" value="<%=rmap.get("PRODUCT_CATEGORY") %>" >
 -->
                <select type="text" class="form-control" id="product_category" name="product_category" >
                    <option value="삼성폰" <% if ("삼성폰".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>삼성폰</option>
                    <option value="삼성태블릿" <% if ("삼성태블릿".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>삼성태블릿</option>
                    <option value="삼성이어폰" <% if ("삼성이어폰".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>삼성이어폰</option>
                    <option value="애플폰" <% if ("애플폰".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>애플폰</option>
                    <option value="애플태블릿" <% if ("애플태블릿".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>애플태블릿</option>
                    <option value="애플이어폰" <% if ("애플이어폰".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>애플이어폰</option>
                    <option value="LG폰" <% if ("LG폰".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>LG폰</option>
                    <option value="LG태블릿" <% if ("LG태블릿".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>LG태블릿</option>
                    <option value="LG이어폰" <% if ("LG이어폰".equals(rmap.get("PRODUCT_CATEGORY"))) { %>selected<% } %>>LG이어폰</option>
                </select>
            </div>
            <div class="form-group">
                <label for="product_name">상품명</label>
                <input type="text" class="form-control" id="product_name" name="product_name" value="<%=rmap.get("PRODUCT_NAME") %>" >
            </div>
            <div class="form-group">
                <label for="product_image">상품 이미지</label><br>
                <img src= "<%=rmap.get("PRODUCT_IMAGE") %>" style="width: 30%; height: 30%;">
                <input type="file" class="form-control" id="product_image" name="product_image" value="">
            </div>
            <div class="form-group">
                <label for="product_color">상품 색상</label>
                <input type="text" class="form-control" id="product_color" name="product_color" value="<%=rmap.get("PRODUCT_COLOR") %>" >
            </div>
            <% if(rmap.get("PRODUCT_STORAGE") != null) { %>
                <div class="form-group">
                    <label for="product_storage">상품 용량</label>
                    <input type="text" class="form-control" id="product_storage" name="product_storage" value="<%=rmap.get("PRODUCT_STORAGE") %>" >
                </div>
            <% } %>
            <div class="form-group">
                <label for="product_describe">상품 설명</label>
                <input type="text" class="form-control" id="product_describe" name="product_describe" value="<%=rmap.get("PRODUCT_DESCRIBE") %>" >
            </div>
            <div class="form-group">
                <label for="product_price">상품 가격</label>
                <input type="text" class="form-control" id="product_price" name="product_price" value="<%=rmap.get("PRODUCT_PRICE") %>" >
            </div>
            <button class="btn btn-primary" onclick="productUpdate()">
                상품수정
            </button>
        </form>
        <hr>
        <!-- 상품상세내역 끝 -->
        <div class="detail-link">
            <button class="btn btn-warning" onclick="productDelete()">
                삭제
            </button>
            &nbsp;
            <button class="btn btn-success" onclick="productList()">
                상품목록
            </button>
        </div>
        <!-- 상품후기 시작 -->
        <hr>
        <h2><small>상품후기</small></h2>
        <% if (rSize == 0) { %>
            <p>상품 후기가 없습니다.</p>
        <% } else { %>
            <table class="table table-bordered">
                <tbody>
                    <% for (int i = 0; i < rSize; i++) {
                        Map<String, Object> tmap = rList.get(i);
                        int reviewGrade = Integer.parseInt(tmap.get("REVIEW_GRADE").toString());
                    %>	
                        <tr>
                            <th><%= tmap.get("MEMBER_NAME") %> <small>(<%= tmap.get("MEMBER_ID") %>)</small></th>
                            <td>
                                <script>
                                    document.write(displayStars('<%= reviewGrade %>'));
                                </script>
                            </td>
                            <td><%= tmap.get("REVIEW_CONTENT") %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
        <!-- 상품후기 끝 -->
	</div>
</body>
</html>