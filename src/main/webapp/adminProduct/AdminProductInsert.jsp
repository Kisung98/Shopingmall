<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
    const productList = () => {
        const confirmList = confirm("상품목록으로 돌아가시겠습니까?");
        if(confirmList){
		    window.location.href="/product/productList";
        }
	}
	const productInsert = () => {
        const confirmInsert = confirm("상품을 등록하시겠습니까?");
        if(confirmInsert){
		    document.querySelector("#f_product").submit();
        }
	}
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
		<!-- 상품입력폼 시작 -->
        <form id="f_product" method="post" action="/product/productInsert" enctype="multipart/form-data">
            <div class="form-group">
                <label for="product_category">상품 카테고리</label>
                <select type="text" class="form-control" id="product_category" name="product_category" >
                    <option value="삼성폰">삼성폰</option>
                    <option value="삼성태블릿">삼성태블릿</option>
                    <option value="삼성이어폰">삼성이어폰</option>
                    <option value="애플폰">애플폰</option>
                    <option value="애플태블릿">애플태블릿</option>
                    <option value="애플이어폰">애플이어폰</option>
                    <option value="LG폰">LG폰</option>
                    <option value="LG태블릿">LG태블릿</option>
                    <option value="LG이어폰">LG이어폰</option>
                </select>
            </div>
            <div class="form-group">
                <label for="product_name">상품명</label>
                <input type="text" class="form-control" id="product_name" name="product_name" value="" >
            </div>
            <div class="form-group">
                <label for="product_image">상품 이미지</label>
                <input type="file" class="form-control" id="product_image" name="product_image" value="" >
            </div>
            <div class="form-group">
                <label for="product_color">상품 색상</label>
                <input type="text" class="form-control" id="product_color" name="product_color" value="" >
            </div>
            <div class="form-group">
                <label for="product_storage">상품 용량</label>
                <input type="text" class="form-control" id="product_storage" name="product_storage" value="" >
            </div>
            <div class="form-group">
                <label for="product_describe">상품 설명</label>
                <input type="text" class="form-control" id="product_describe" name="product_describe" value="" >
            </div>
            <div class="form-group">
                <label for="product_price">상품 가격</label>
                <input type="text" class="form-control" id="product_price" name="product_price" value="" >
            </div>
            <button class="btn btn-primary" onclick="productInsert()">
                상품등록
            </button>
        </form>
        <hr>
        <!-- 상품입력폼 끝 -->
        <div class="detail-link">
            &nbsp;
            <button class="btn btn-success" onclick="productList()">
                상품목록
            </button>
        </div>
	</div>
</body>
</html>