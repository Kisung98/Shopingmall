<%@page import="com.example.demo.adminDao.fileinsertDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드한 파일 확인</title>

<%
List<Map<String, Object>> fList = (List<Map<String, Object>>) request.getAttribute("fList");
%>

</head>
<body>

	<%
	if (fList != null)
	{
		for (Map<String, Object> file : fList)
		{
	%>

	<div style="background-color: gray; width: 20%;" >
		<p><%=file.get("TITLE")%></p>
		<p><%=file.get("CONTENT")%></p>
		<img src="<%=file.get("FILE_PATH")%>" style="width: 30%; height: 30%;">
	</div>


	<%
	} //end of for
	} //end of if
	else
	{
	%>
	<h1>조회결과가 없습니다</h1>

	<%
	}
	%>








</body>
</html>