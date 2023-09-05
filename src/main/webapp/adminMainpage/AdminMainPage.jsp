<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String adminId = (String) session.getAttribute("member_id");
%>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자메인페이지</title>
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 아이콘 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="jumbotron bg-primary text-white text-center">
            <h2>ReturnHappy 관리자 페이지</h2>
        </div>
        <div class="text-center mb-3">
        </div>
        <div class="d-flex justify-content-center">
            <a class="btn btn-primary mx-2" href="/member/memberList">
                <i class="fas fa-users"></i> 회원관리
            </a>
            <a class="btn btn-primary mx-2" href="/product/productList">
                <i class="fas fa-box"></i> 상품관리
            </a>
            <a class="btn btn-primary mx-2" href="/order/orderList">
                <i class="fas fa-clipboard-list"></i> 주문관리
            </a>
            <a class="btn btn-primary mx-2" href="/qna/qnaList">
                <i class="fas fa-question-circle"></i> QnA
            </a>
            <a class="btn btn-primary mx-2" href="/notice/noticeList">
                <i class="fas fa-bell"></i> 공지사항
            </a>
        </div>
    </div>

    <!-- 부트스트랩 JS 스크립트 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // 로그아웃 함수
        const logout = () => {
            console.log('11');
            window.location.href = "";
        }
    </script>
</body>
</html>
