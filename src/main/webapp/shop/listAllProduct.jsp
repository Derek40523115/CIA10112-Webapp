<%@page import="java.util.List"%>
<%@page import="com.shop.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
    ProductService productSvc = new ProductService();
    List<ProductVO> list = productSvc.getAll();
    pageContext.setAttribute("list",list);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有商品資料 - listAllProduct.jsp</h3>
		 <h4><a href="product_select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
<%@ include file="page1.file" %> 
<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
	
	<tr>
			<td>${productVO.product_id}</td>
			<td>${productVO.product_category_id}</td>
			<td>${productVO.product_describtion}</td>
			<td>${productVO.product_price}</td>
			<td>${productVO.product_name}</td>
			<td>${productVO.product_status}</td> 
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shop/Product.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="productId"  value="${productVO.product_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shop/Product.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="productId"  value="${productVO.product_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
	</tr>
	
	
</c:forEach>
</table>
<%@ include file="page2.file" %>
</body>
</html>