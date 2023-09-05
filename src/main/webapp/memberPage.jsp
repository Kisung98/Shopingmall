<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Happy Store</title>
<%
List<Map<String, Object>> pList = (List<Map<String, Object>>) request.getAttribute("pList");
%>

<!-- 부트스트랩 CSS 링크 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩 아이콘 CSS 링크 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script>
  const productDetail = (product_num) => {
        location.href="/MemberMainpage/MemberProductDetail?product_num="+product_num;
    }
  </script>

<style>
/* Apply custom styles to the carousel control buttons */
.carousel-control-prev, .carousel-control-next {
	background-color: rgba(0, 0, 0, 0);
	border: none;
	width: 100px;
	height: 450px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	z-index: 1;
}

.content {
	margin-left: 100px;
	padding: auto;
	 display: flex;
    justify-content: center;
    align-items: center;
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

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: transparent;
	border: 1px solid transparent;
	border-radius: 50%;
	z-index: 1;
}

.carousel-control-prev-icon:before {
	content: '<';
	font-size: 50px;
	color: rgb(55, 55, 55);
}

.carousel-control-next-icon:before {
	content: '>';
	font-size: 50px;
	color: rgb(55, 55, 55);
}
</style>

</head>

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


<body>
	<!--include에  Map<String,Object> member = (Map<String,Object>)session.getAttribute("member"); 코드가 있다  -->
	<%@include file="/include/header.jsp"%>
	<br>


	<div class="content">
		<form action="/MemberMainpage/productSearch" style="display: inline;">
			<input type="text" style="width: 500px;" class="rounded-input" placeholder="물건이름으로 검색" name="product_name">
			<input type="submit" value="검색" class="rounded-submit">
		</form>
	</div>






	<!-- 메인페이지 광고 배너 -->
	<br>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../images/광고이미지1.jpg" class="d-block w-100" alt="Ad Image 1">
			</div>
			<div class="carousel-item">
				<img src="../images/광고이미지2.jpg" class="d-block w-100" alt="Ad Image 2">
			</div>
			<div class="carousel-item">
				<img src="../images/광고이미지3.jpg" class="d-block w-100" alt="Ad Image 3">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true" style="font-size: 40px; width: 60px; height: 60px; margin: -30px 0;"></span> <span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true" style="font-size: 40px; width: 60px; height: 60px; margin: -30px 0;"></span> <span class="sr-only">Next</span>
		</a>
		</a>
	</div>

	<!-- 메인페이지 광고 배너 -->
	<br>
	<br>
	<br>
	<!-- 상품목록 시작 -->
	<div class="row">
		<%
		for (int i = 0; i < pList.size(); i++)
		{
			if (pList.size() == i)
				break;
			Map<String, Object> rmap = pList.get(i);
		%>
		<div class="col-md-4 mb-3">
			<div class="card">
				<a href="/MemberMainpage/memberProductDetail?product_num=<%=rmap.get("PRODUCT_NUM")%>">
					<div class="card-img-top" style="width: 100%; height: 200px; background-image: url('<%=rmap.get("PRODUCT_IMAGE")%>'); background-size: contain; background-repeat: no-repeat; background-position: center;"></div>
				</a>
				<div class="card-body">
					<h5 class="card-title"><%=rmap.get("PRODUCT_NUM")%>)
						<%=rmap.get("PRODUCT_NAME")%></h5>
					<p class="card-text">
						가격:
						<%=rmap.get("PRODUCT_PRICE")%>원
					</p>
					<!-- 추가적인 필드들에 대한 카드 내용도 추가 -->
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<!-- 상품목록 끝 -->
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>