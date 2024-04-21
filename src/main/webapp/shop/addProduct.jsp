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

<h3>�ӫ~�s�W</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="Product.do" name="form1">

	<table>
	<tr>
		<td>�ӫ~���O�s��:</td>
		<td><input type="TEXT" name="productCategoryId" value="<%= (productVO==null)? "1" : productVO.getProduct_category_id() %>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���e:</td>
		<td><input type="TEXT" name="productDescribtion"   value="<%= (productVO==null)? "���ڶR" : productVO.getProduct_describtion() %>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~����:</td>
		<td><input type="TEXT" name="productPrice" value="<%= (productVO==null)? "100" : productVO.getProduct_price() %>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="productName"   value="<%= (productVO==null)? "�¿}�|" : productVO.getProduct_name() %>" size="45"/></td>
	</tr>
	
	</table>
	
	<select name="productStatus">
		<option>�п�ܰӫ~���A</option>
		<option value="true">�W�[</option>
		<option value="false">�U�[</option>
	</select>
	
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W"></FORM>
	
	
	
</body>
</html>