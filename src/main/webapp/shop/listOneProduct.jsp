<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="com.shop.model.*" %>

<% ProductVO productVO = (ProductVO) request.getAttribute("productVO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<h3>單一商品資料 - listOneProduct.jsp</h3>
<a href="product_select_page.jsp">回首頁</a>

<%=productVO.getProduct_id() %>
<%=productVO.getProduct_category_id() %>
<%=productVO.getProduct_describtion() %>
</body>
</html>