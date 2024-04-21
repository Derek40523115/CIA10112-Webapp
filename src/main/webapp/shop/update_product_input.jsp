<%@page import="com.shop.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<% ProductVO productVO = (ProductVO) request.getAttribute("productVO"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�ӫ~��ƭק� - update_product_input.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
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

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body>

<table id="table-1">
	<tr><td>
		 <h3>���u��ƭק� - update_product_input.jsp</h3>
		 <h4><a href="product.select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

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
		<td>���u�s��:<font color=red><b>*</b></font></td>
		<td><%=productVO.getProduct_id()%></td>
	</tr>
	<tr>
		<td>�ӫ~���O�s��:</td>
		<td><input type="TEXT" name="productCategoryId" value="<%=productVO.getProduct_category_id() %>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���e:</td>
		<td><input type="TEXT" name="productDescribtion"   value="<%=productVO.getProduct_describtion() %>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~����:</td>
		<td><input type="TEXT" name="productPrice" value="<%=productVO.getProduct_price() %>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="productName"   value="<%=productVO.getProduct_name() %>" size="45"/></td>
	</tr>
	
	</table>
	
	<select name="productStatus">
		<option>�п�ܰӫ~���A</option>
		<option value="true" ${(productVO.product_id == TRUE )?'selected':''}>�W�[</option>
		<option value="false" ${(productVO.product_id == FALSE )?'selected':''}>�U�[</option>
	</select>
	
	<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="productId" value="<%=productVO.getProduct_id() %>">
	<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>