<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Happy STORE 결제</title>
<script type="text/javascript">
	function payment() {
		const radioButton = document
				.querySelector('input[name="payment-method"]:checked');
		if (!radioButton) {
			alert("결제 방법을 선택하세요.");
			return false;
		}

		const paymentMethod = radioButton.value;
		let jspPath;

		if (paymentMethod === "kakao-pay") {
			jspPath = "../memberPayment/kakaopayment.jsp";
		} else if (paymentMethod === "pay") {
			jspPath = "../memberPayment/paySuccess.jsp";
		}

		if (jspPath) {
			window.location.href = jspPath;
		}
	}

	function handlePaymentMethodChange() {
		const onSitePaymentRadio = document.getElementById("pay");
		const checkoutButton = document.getElementById("checkout-button");

		if (onSitePaymentRadio.checked) {
			checkoutButton.setAttribute("onclick", "payment()");
		} else {
			checkoutButton.removeAttribute("onclick");
		}
	}
</script>

<style>
body {
	margin: 0;
	padding: 0;
}

hr {
	margin-top: 50px;
	margin-bottom: 50px;
	border: none;
	border-top: 2px solid #000;
}

.payment-details {
	font-size: 20px;
	margin-bottom: 30px;
}

.payment-info {
	font-size: 16px;
	margin-bottom: 30px;
}

.checkout-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #fdfdd2;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #f9efac;
	color: #001C30;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s ease;
	font: bold;
}

.btn:hover {
	background-color: #ffd978;
}

.container {
	max-width: 900px;
	margin:auto;
	padding: 150px;
	background-color: #fafae0;
	border-radius: 100px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	font: bold;
}

table {
	width: 130%;
	border-collapse: collapse;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.1);
	font: bold;
	margin: 0;
	margin-left: -95px; /* 원하는 만큼 왼쪽으로 이동 */
}

th, td {
	padding: 15px;
	text-align: left;
	background-color: #f7f7f7;
	color: #333;
	margin: 0; /* 셀 내부도 왼쪽으로 이동 */
}

th {
	background-color: #e3dac9;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #e3dac9;
}

tr:hover {
	background-color: #e3dac9;
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
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 50px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-submit:hover {
	background-color: #e6005c;
}

#wrapper {
	height: auto;
	min-height: 200%;
	padding-bottom: (footer높이);
}

.footer {
	height: (footer높이);
	position: relative;
	transform: translateY(-100%);
}
</style>
<%
List<Map<String, Object>> cList = (List<Map<String, Object>>) request.getAttribute("cList");
%>
</head>
<body>
	<div class="header">
		<%@include file="/include/header.jsp"%>
	</div>

	<div class="container">
		<h2 style="margin-top: -80px;">주문 정보 확인</h2>
		<br>

		<div class="payment-details">
			<p>
				회원명 :
				<%=member.get("MEMBER_ID")%>
			</p>
			<p>
				전화번호 :
				<%=member.get("MEMBER_PHONE")%>
			</p>
			<p>
				배송지 :
				<%=member.get("MEMBER_ADDRESS")%>
			</p>
		</div>
		<hr>
		<table>
			<tr>
				<th style="width: 100PX;">장바구니번호</th>
				<th style="width: 100PX;">제품이미지</th>
				<th>제품명</th>
				<th>색상</th>
				<th>용량</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<%
			int price_amount = 0;
			%>
			<%
			if (cList != null) {

				for (Map<String, Object> cMap : cList) {
					int p_price = 0;
					int cp_count = 0;
					if (cMap.get("PRODUCT_PRICE") != null) {
						p_price = Integer.parseInt(cMap.get("PRODUCT_PRICE").toString());
					}
					if (cMap.get("CART_COUNT") != null) {
						cp_count = Integer.parseInt(cMap.get("CART_COUNT").toString());
					}
						int product_amount = p_price * cp_count;
						price_amount = price_amount + product_amount;
			%>
			<tr>
				<td><%=cMap.get("CART_NUM")%></td>
				<td style="width:200px;">
					<img src="<%=cMap.get("PRODUCT_IMAGE")%>" style="width: 100px; height: auto;">
				</td>
				<td><%=cMap.get("PRODUCT_NAME")%></td>
				<td><%=cMap.get("CART_COLOR")%></td>
				<td><%=cMap.get("PRODUCT_STORAGE")%></td>
				<td><%=cMap.get("CART_COUNT")%></td>
				<td><%=product_amount%>원
				</td>

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
		<br>
		<br>
		<h4>
			총결제금액:
			<%=price_amount%>원
		</h4>
		<hr>
		<h2>결제 선택</h2>
		<br>
		<div class="payment-info">
			<input type="radio" id="kakao-payRadio" name="payment-method" value="카카오페이">
			<label for="kakao-pay">카카오페이(KAKAOPAY)</label> <br>
			<br>
			<input type="radio" id="payRadio" name="payment-method" value="무통장입금" onchange="handlePaymentMethodChange()">
			<label for="pay">무통장입금</label>
		</div>

		<!--카카오페이결제버튼 -->
		<button type="button" onclick="onClickPayment()" style="display: none;" id="kakao-payButton">
			<img src="../kakaopay/payment_icon_yellow_small.png" alt="Pay with Kakao Pay" onclick="kakaoPay()" />
		</button>

		<!-- 무통장입금버튼 -->
		<button type="button" style="display: none;" onclick="Pay()" id="payButton">무통장입금</button>

		<!--담긴 물품 목록들 카카오페이 제품목록에 담을 값이다  -->
		<%
		String products = ""; // products 문자열을 초기화합니다.

		for (Map<String, Object> cMap : cList) {
			String productName = cMap.get("PRODUCT_NAME").toString(); // 문자열로 변환
			products += productName + ", "; // 쉼표와 공백으로 연결
		}

		// 맨 뒤의 쉼표와 공백을 제거
		if (!products.isEmpty()) {
			products = products.substring(0, products.length() - 2);
		}
		
		%>



		<script>
		const radioKakao = document.getElementById('kakao-payRadio');
		const radioNormal = document.getElementById('payRadio');
		const kakaoPayment = document.getElementById('kakao-payButton');
		const normalPayment = document.getElementById('payButton');
		

		radioNormal.addEventListener('click', () => {
		  normalPayment.style.display = 'block';
		  kakaoPayment.style.display = 'none';
		});

		radioKakao.addEventListener('click', () => {
		  normalPayment.style.display = 'none';
		  kakaoPayment.style.display = 'block';
		});
		
		function kakaoPay() {
			const pay_method = document.getElementById('kakao-payRadio').value;
			location.href='/payment/kakaopay?products=<%=products%>&member_name=<%=member.get("MEMBER_NAME")%>&price_amount=<%=price_amount%>&member_num=<%=member.get("MEMBER_NUM")%>&pay_method='+pay_method;
		}
		
		function Pay() {
			const pay_method = document.getElementById('payRadio').value;
			location.href='/payment/pay?member_name=<%=member.get("MEMBER_NAME")%>&price_amount=<%=price_amount%>&member_num=<%=member.get("MEMBER_NUM")%>&pay_method='+pay_method;
			
		}
		
		
		</script>

	</div>
	</form>
</body>
</html>