<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>무통장결제 성공</title>
    <style>
        .text {
            font: bold 18px "malgun gothic";
            margin-top: 100px;
            margin-bottom: 50px;
            text-align: center;
            margin-right: 30px;
        }

        .content {
            font: bold 15px "malgun gothic";
            text-align: center;
            display: inline-block;
            padding: 20px;
            background-color: #e3dac9;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .button {
            margin-top: 20px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f9efac;
            color: #001C30;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            margin: 0 10px;
        }

        .btn:hover {
            background-color: #ffd978;
        }
    </style>
</head>
<body>
<%@include file="/include/header.jsp"%>

<div class="text">
    <p>주문해주셔서 감사합니다 !</p>
        <br>
    <p>아래 계좌로 입금 해주세요 :-) </p>
        <br>
        <br>
        <br>
    <div class="content">
        <p>입금 계좌 : 국민은행 943202-00-309075</p>
        <br>
        <p>예금주: HappyStore</p>
        <br>
        <p>입금 기한 : 입금은 3일 이내에 완료해주시길 바랍니다.</p>
    </div>
</div>

<div class="btn-container">
    <a class="btn" href="/MemberMainpage/MemberMainpage">Home</a>
</div>
</body>
</html>
