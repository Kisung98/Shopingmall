<%@page import="com.example.demo.memberDao.MemberCartDao"%>
<%@ page language="java"		pageEncoding="UTF-8"%>
<%Map<String,Object> member2 =(Map<String,Object>)session.getAttribute("member"); %>
<%Map<String,Object> pMap = (Map<String,Object>)request.getAttribute("pMap"); %>
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

    const today = new Date();   

    const onClickPayment = () => {
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
        IMP.request_pay({
        pg: 'kakaopay',
        pay_method: 'card',
        merchant_uid: "uid"+new Date().getTime(),
        
        name: '<%=pMap.get("products").toString()%>',
        amount: <%=pMap.get("price_amount") %>, //변수로 변경
        
        buyer_name: '배선영', //변수로 변경
        buyer_tel: '010-7501-3037', //변수로 변경
        buyer_addr: '서울시 강서구 화곡동', //변수로 변경
        // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
        // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
        // location.href = '카카오결제 컨트롤러로 쿼리스트링을 이용해 결제금액값과 회원번호를 보낸다'
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
          // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
          // 자세한 설명은 구글링으로 보시는게 좋습니다.
        } else { 
          const msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
        }
        console.log(msg);
      });
    };
          
  </script>  
  <style>
    .pay{
        font: bold 18px "malgun gothic";
        margin-right: 100px;
    }
    .pay button {
            border: none;
            outline: none; 
            cursor: pointer;
        }
    
  </style>
</head>
<body>
    <%@include file="/include/header.jsp"%>
    
    <div class="pay" style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh;">
      <p style="margin-bottom: 10px;">카카오페이 결제를 진행하시겠습니까?</p>
      <p style="margin-bottom: 30px;">진행하시려면 아래 버튼을 눌러주세요</p>
      <button type="button" onclick="onClickPayment()">
        <img src="../kakaopay/payment_icon_yellow_small.png" alt="Pay with Kakao Pay"/>
      </button>
    </div>
  </body>
</html>