<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<h3>商品查詢 :</h3>

	<ul>
		<li>
   		 <FORM METHOD="post" ACTION="Product.do" >
        	<b>輸入商品編號 (1 or 2):</b>
        	<input type="text" name="empno">
        	<input type="hidden" name="action" value="getOne_For_Display">
        	<input type="submit" value="送出">
    </FORM>
  </li>
	</ul>
	>
</body>
</html>