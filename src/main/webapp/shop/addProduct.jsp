<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.shop.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% ProductVO productVO = (ProductVO) request.getAttribute("productVO"); %>

<%-- <%= productVO==null %>---<%=productVO.product_id %>     --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>

<h3>商品新增</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="Product.do" name="form1">

	<table>
	<tr>
		<td>商品類別編號:</td>
		<td><input type="TEXT" name="productCategoryId" value="<%= (productVO==null)? "1" : productVO.getProduct_category_id() %>" size="45"/></td>
	</tr>
	<tr>
		<td>商品內容:</td>
		<td><input type="TEXT" name="productDescribtion"   value="<%= (productVO==null)? "給我買" : productVO.getProduct_describtion() %>" size="45"/></td>
	</tr>
	<tr>
		<td>商品價格:</td>
		<td><input type="TEXT" name="productPrice" value="<%= (productVO==null)? "100" : productVO.getProduct_price() %>" size="45"/></td>
	</tr>
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="productName"   value="<%= (productVO==null)? "黑糖糕" : productVO.getProduct_name() %>" size="45"/></td>
	</tr>
	
	</table>
	
	<select name="productStatus">
		<option>請選擇商品狀態</option>
		<option value="true">上架</option>
		<option value="false">下架</option>
	</select>
	
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="送出新增"></FORM>
	
	
	
</body>
</html>