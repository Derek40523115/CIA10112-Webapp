<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.shop.model.*" %>

<% ProductVO productVO = (ProductVO) request.getAttribute("productVO"); %>
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
	width: 600px;
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

<table id="table-1">
	<tr><td>
		 <h3>商品資料 - listOneProduct.jsp</h3>
		 <h4><a href="product_select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>


<table>
	<tr>
		<td><%=productVO.getProduct_id() %></td>
		<td><%=productVO.getProduct_category_id() %></td>
		<td><%=productVO.getProduct_describtion() %></td>
		<td><%=productVO.getProduct_price() %></td>
		<td><%=productVO.getProduct_name() %></td>
		<td><%=productVO.getProduct_status() %></td>
	</tr>
</table>



</body>
</html>