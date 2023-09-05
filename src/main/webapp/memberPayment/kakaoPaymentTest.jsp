<%@ page language="java"		pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<%
  String member_name = null;
  member_name = (String)session.getAttribute("member_name");

  String member_phone = null;
  member_phone = (String)session.getAttribute("member_phone");

  String member_address = null;
  member_address = (String)session.getAttribute("member_address");
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KakaoPay API</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  <script>
    var IMP = window.IMP; // 생략가능
    IMP.init('imp11381005'); //포트원 가맹점 식별코드 imp11381005
    //사용자가 선택한 상품과 가격 넘기기
    let prod_name=null;
    let prod_price=0;
    const today = new Date();   
    
    /*카카오페이 결제하기를 눌렀을떄 뜨는 api 자스함수  */
    const onClickPayment = () => {
        //const product_name = document.querySelector("#card-title").value;
        //const product_price = document.querySelector("#prod_price").value;
        IMP.request_pay({
        pg: 'kakaopay',
        pay_method: 'card',
        merchant_uid: "uid"+new Date().getTime(),
        name: prod_name, 
        amount: prod_price, 
        buyer_name: '<%=member_name%>', 
        buyer_tel: '<%=member_phone%>', 
        buyer_addr: '<%=member_address%>', 
        },
         function (rsp) {
          console.log(rsp);
          const { success, error_msg, amount, name} = rsp;
          let msg= '';
        if (success) {
          msg = '결제가 완료되었습니다.';
          msg += '결제 금액 : ' + rsp.paid_amount;
          location.href="/memberPayment/kakaoPaySuccess.jsp";//결제 성공시  이동하기
          // success.submit();
        } else { 
          const msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
        }
        console.log(msg);
      });
    };
          
    /*고르면 상품이 상자에 담기는 함수  */
    const updateSquareBox = (content) => {
    const squareBox = document.querySelector(".square-box");
    squareBox.textContent = content;
  };

    document.addEventListener("DOMContentLoaded", () => {
    const buttons = document.querySelectorAll(".card .btn-primary");
    
      buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        const card = event.target.closest(".card");
        const cardTitle = card.querySelector(".card-title").textContent;
        const cardPrice = card.querySelector(".card-price").textContent;
        updateSquareBox(cardTitle +"-"+ cardPrice +"원");
        prod_name = cardTitle;
        prod_price = cardPrice;
        console.log(cardTitle)
        console.log(cardPrice)
      });
    });
  });

  </script>  
  <style>

    
  .square-box {
    width: 800px;
    height: 200px; 
    background-color: #e7e7e7; 
    border: 2px solid #fff0d8; 
    margin-left: auto;
    margin-right: auto;
  }

  </style>
</head>
<body>
    <%@include file="/include/header.jsp"%>

<!--장바구니에 담긴 물건들이 여기에 뜨게 해야함  -->
      <div class="container">
        <div class="row" style="margin: 10px 10px">
          <div class="col-md-4 col-sm-3">
            <div class="card" style="width: 18rem">
              <img src="/images/아이폰.jpg" class="card-img-top" alt="first" />
              <div class="card-body">
                <h5 class="card-title">아이폰</h5>
                <p class="card-price">500000</p>
                <p class="card-text">
                  비싸다 
                </p>
                <button class="btn btn-primary" onclick="return false;">구매하기</button>
              </div>
            </div>
          </div>

          <div class="col-md-4 col-sm-3">
            <div class="card" style="width: 18rem">
              <img src="/images/아이패드.jpg" class="card-img-top" alt="first" />
              <div class="card-body">
                <h5 class="card-title">아이패드</h5>
                <p class="card-price">200000</p>
                <p class="card-text">
                  중고임
                </p>
                <button class="btn btn-primary" onclick="return false;">구매하기</button>
              </div>
            </div>
          </div>

          <div class="col-md-4 col-sm-3">
            <div class="card" style="width: 18rem">
              <img src="/images/에어팟.jpg" class="card-img-top" alt="first" />
              <div class="card-body">
                <h5 class="card-title">에어팟</h5>
                <p class="card-price">100000</p>
                <p class="card-text">
                  음악은 나라가 허용해준 유일한 마약
                </p>
                <button class="btn btn-primary" onclick="return false;">구매하기</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="square-box"></div>

    </div>
      <div class="pay" style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh;">
      <p style="margin-bottom: 10px;">카카오페이 결제를 진행하시겠습니까?</p>
      <p style="margin-bottom: 30px;">진행하시려면 아래 버튼을 눌러주세요</p>
      <button type="button" onclick="onClickPayment()">
        <img src="../kakaopay/payment_icon_yellow_small.png" alt="Pay with Kakao Pay"/>
      </button>
    </div>
    <%@include file="/include/footer.jsp"%>
  </body>
</html>