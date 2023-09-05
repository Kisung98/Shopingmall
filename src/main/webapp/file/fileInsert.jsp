<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>File Upload with Parameters</title>
</head>
<body>

	<form action="/file/Insert" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="제목">
		<br>
		<input type="text" name="content" placeholder="내용">
		<br>
		<input type="file" name="file">
		<br>
		<input type="submit" value="Upload">
	</form>
	
</body>
</html>