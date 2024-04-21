<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>

<table id="table-1">
   <tr><td><h3>IBM Product: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<body>
	<h3>商品查詢 :</h3>
	
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
	    	<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
	
	 <li><a href='listAllProduct.jsp'>List</a> all Product.  <br><br></li>
		<li>
   		 <FORM METHOD="post" ACTION="Product.do" >
        	<b>輸入商品編號 (1 or 2):</b>
        	<input type="text" name="productId">
        	<input type="hidden" name="action" value="getOne_For_Display">
        	<input type="submit" value="送出">
   		 </FORM>
  		</li>
	</ul>
	
	<ul>
  		<li><a href='addProduct.jsp'>Add</a> a new Product.</li>
	</ul>
</body>
</html>