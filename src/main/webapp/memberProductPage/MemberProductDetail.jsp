<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap, java.util.Arrays"%>
<%
//로그인을 하지 않았더라도 상품 상세보기는 출력되어야 한다
Map<String,Object> member2 = (Map)session.getAttribute("member");

//로그인이 안되어있으면 빈깡통 member2객체생성
if(member2 == null){
	member2 = new HashMap<String,Object>();
}


int pSize = 0;
int rSize = 0;
List<Map<String, Object>> pList = (List<Map<String, Object>>) request.getAttribute("pList");
List<String> cList = new ArrayList<>();
List<Map<String, Object>> rList = new ArrayList<>();
Map<String, Object> rmap = new HashMap<>();
Map<String, Object> pmap = new HashMap<>();
if (pList != null) {
	pSize = pList.size();
	rmap = pList.get(0);
	pmap = pList.get(1);

	if (rmap.get("PRODUCT_COLOR") != null) {
		String color = (String) rmap.get("PRODUCT_COLOR");
		cList = Arrays.asList(color.split(","));
	}

	List<Map<String, Object>> reviewList = (List<Map<String, Object>>) pmap.get("product_reivew");
	rList = new ArrayList<>(reviewList);

	rSize = rList.size();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
    const memberMainPage = () => {
        window.location.href="/MemberMainpage/MemberMainpage";
    }

    const productCart = () => {
        const confirmCart = confirm("상품을 장바구니에 담겠습니까??");
        if (confirmCart) {
            document.querySelector("#f_product").submit();
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
	<%@include file="/include/header.jsp"%>
	<!-- /header -->
	<div class="container">
		<div class="page-header">
			<h2>상품상세정보</h2>
			<hr />
		</div>
	<!-- 상품상세내역 시작 -->
<form id="f_product" method="post" action="/cart/cartInsert" enctype="multipart/form-data">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="product_image"></label><br> 
                <img src="<%=rmap.get("PRODUCT_IMAGE")%>" style="width: 100%; max-width: 400px; height: 500px;">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="product_num">상품번호</label>
                <input type="text" class="form-control" id="product_num" name="product_num" value="<%=rmap.get("PRODUCT_NUM")%>" readonly>
            </div>
            <div class="form-group">
                <label for="product_category">상품 카테고리</label>
                <input type="text" class="form-control" id="product_category" name="product_category" value="<%=rmap.get("PRODUCT_CATEGORY")%>" readonly>
            </div>
            <div class="form-group">
                <label for="product_name">상품명</label>
                <input type="text" class="form-control" id="product_name" name="product_name" value="<%=rmap.get("PRODUCT_NAME")%>" readonly>
            </div>
            <div class="form-group">
                <label for="product_color">상품 색상</label>
                <select type="text" class="form-control" id="product_color" name="product_color">
                    <%
                    if (cList.size() == 0) {
                    %>
                    <option value="null">null</option>
                    <%
                    } else {
                    %>
                    <%
                    for (int i = 0; i < cList.size(); i++) {
                    %>
                    <option value="<%=cList.get(i)%>"><%=cList.get(i)%></option>
                    <%
                    }
                    %>
                    <%
                    }
                    %>
                </select>
            </div>
            <%
            if (rmap.get("PRODUCT_STORAGE") != null) {
            %>
            <div class="form-group">
                <label for="product_storage">상품 용량</label>
                <input type="text" class="form-control" id="product_storage" name="product_storage" value="<%=rmap.get("PRODUCT_STORAGE")%>" readonly>
            </div>
            <%
            }
            %>
            <div class="form-group">
                <label for="product_describe">상품 설명</label>
                <input type="text" class="form-control" id="product_describe" name="product_describe" value="<%=rmap.get("PRODUCT_DESCRIBE")%>" readonly>
            </div>
            <div class="form-group">
                <label for="product_price">상품 가격</label>
                <input type="text" class="form-control" id="product_price" name="product_price" value="<%=rmap.get("PRODUCT_PRICE")%>" readonly>
            </div>
            <div class="form-group">
                <label for="cart_count">구매 수량</label>
                <input type="number" class="form-control" id="cart_count" name="cart_count" min="1" value="1" oninput="calculatePurchaseAmount()" style="width: 80px;">
            </div>
        </div>
    </div>
    <script>
        function addToCart() {
            let cart_member_num = '<%=member2.get("MEMBER_NUM")%>';
            const cart_product = '<%=rmap.get("PRODUCT_NUM")%>';
            const cart_count = document.getElementById("cart_count").value;
            const cart_color = document.getElementById("product_color").value;

            const queryString = "/cart/cartInsert?cart_member_num="+cart_member_num+"&cart_product="+cart_product+"&cart_count="+cart_count+"&cart_color="+cart_color;
            //console.log(queryString);
            location.href = queryString;
        }
    </script>
</form>
<hr>
<!-- 상품상세내역 끝 -->

<div class="detail-link" style="display: flex; justify-content: flex-end;">
    <style>
        .btn-outline-dark {
            color: #333;
            background-color: #e3dac9;
            border-color: #e3dac9;
            margin-right: 10px;
        }

        .btn-outline-dark:hover {
            background-color: #edd09b;
            border-color: #edd09b;
        }
    </style>
    <button class="btn btn-outline-dark" onclick="memberMainPage()">상품목록</button>
    <% if(member!=null) { %>
        <button class="btn btn-outline-dark" type="button" onclick="addToCart()">장바구니 담기</button>
    <% } %>
</div>

		<!-- 상품후기 시작 -->
		<hr>
		<h2>
			<small>상품후기</small>
		</h2>
		<%
		if (rSize == 0) {
		%>
		<p>상품 후기가 없습니다.</p>
		<%
		} else {
		%>
		<table class="table table-bordered">
			<tbody>
				<%
				for (int i = 0; i < rSize; i++) {
					Map<String, Object> tmap = rList.get(i);
					int reviewGrade = Integer.parseInt(tmap.get("REVIEW_GRADE").toString());
				%>
				<tr>
					<th class="col-md-2"><%=tmap.get("MEMBER_NAME")%> <small>(<%=tmap.get("MEMBER_ID")%>)
					</small></th>
					<td class="col-md-1">
						<script>
                                    document.write(displayStars('<%=reviewGrade%>'));
                                </script>
					</td>
					<td><%=tmap.get("REVIEW_CONTENT")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		}
		%>
		<!-- 상품후기 끝 -->
	</div>
</body>
</html>