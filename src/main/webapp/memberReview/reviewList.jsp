<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 후기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
    table {
        width: 90%;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
        margin-left: auto;
        margin-right: auto;
    }
    
    th, td {
        font: bold 14px "malgun gothic";
        padding: 12px;
        text-align: left;
        background-color: #f7f7f7;
        color: #333;
        width: 20%;
    }
    
    th {
        background-color: #fae3eb;
        font-weight: bold;
    }
    
    .rounded-input {
        border: none;
        border-radius: 20px;
        padding: 10px 15px;
        font-size: 16px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }
    
    #review {
        font: bold 14px "malgun gothic";
        height: 100%;
        margin-top: 30px;
    }
    </style>

<%
List<Map<String, Object>> reviewList = (List<Map<String, Object>>) request.getAttribute("reviewList");
%>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id='review'>
		<div>
			<table>
				<tr>
					<th>후기 번호</th>
					<th>별점</th>
					<th>작성자</th>
					<th>내용</th>
				</tr>
				<%
				if (reviewList != null)
				{
					for (Map<String, Object> pmap : reviewList)
					{
				%>
				<tr>
					<td>
						<%=pmap.get("ROWNUM")%>
					</td>
					<td>
						<%=pmap.get("REVIEW_GRADE")%>
					</td>
					<td>
						<%=pmap.get("REVIEW_WRITER")%>
					</td>
                    <td>
						<%=pmap.get("REVIEW_CONTENT")%>
					</td>
				</tr>
				<%
				} //end of for
				} //end of if
				else
				{
				%>
				<tr>
					<td colspan="9">등록된 후기가 없습니다.</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>