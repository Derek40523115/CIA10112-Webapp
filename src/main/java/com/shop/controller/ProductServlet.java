package com.shop.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.ProductService;
import com.shop.model.ProductVO;


@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			//**************1.接受參數 輸入格式的錯誤處理*******************
			String str = request.getParameter("productId");
			
			if(str == null || (str.trim().length() == 0)) {
				errorMsgs.add("請輸入商品編號");
			}
		
			Integer productId = null;
			
			try {
				productId = Integer.valueOf(str);
			}catch(Exception e) {
				errorMsgs.add("商品編號不正確");
			}
			//***寄送錯誤訊息*****
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request.getRequestDispatcher("/shop/product_select_page.jsp");//路徑是否正確
				failureView.forward(request, response);
				return;
			}
			//*******************查詢資料**********************
			ProductService productSvc = new ProductService();
			ProductVO productVO = productSvc.getOneProduct(productId);
			if(productVO == null) {
				errorMsgs.add("查無資料");
			}
			//*********寄送錯誤訊息************
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request.getRequestDispatcher("/shop/product_select_page.jsp");//路徑是否正確
				failureView.forward(request, response);
				return;
			}
			//*********轉交資料***********
			request.setAttribute("productVO", productVO);
			String url = "/shop/listOneProduct.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			//*******************接受參數 -- 輸入格式錯誤處理**************
			String productName = request.getParameter("productName");
			System.out.println(productName);
			String productReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";//要注意
			if(productName == null || productName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			}else if(!productName.trim().matches(productReg)) {
				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_");
			}
			
			Integer productCategoryId = null;
			
			try {
				productCategoryId = Integer.valueOf(request.getParameter("productCategoryId").trim());
			}catch (NumberFormatException e) {
				errorMsgs.add("商品類型編號請填數字");
			}
			
			String productDescribtion = request.getParameter("productDescribtion");
//			String productDescribtionReg = ""
			if(productDescribtion == null || productDescribtion.trim().length() == 0) {
				errorMsgs.add("商品內容，請勿空白");
			}
			
			Integer productPrice = null;
			
			try {
				productPrice = Integer.valueOf(request.getParameter("productPrice").trim());
			}catch(NumberFormatException e) {
				errorMsgs.add("商品價格請填數字");
			}
			//要注意 不會
			Boolean productStatus = null;
//			System.out.println(request.getParameter("productStatus").trim());
			if(request.getParameter("productStatus").trim().equals("true")) {
				productStatus = Boolean.valueOf(true);
//				productStatus = true;
				System.out.println("true");
			}else if(request.getParameter("productStatus").trim().equals("false")) {
//				productStatus = false;
				System.out.println("false");
				productStatus = Boolean.valueOf(false);
			}
			
//			try{
//				productStatus = Boolean.valueOf(request.getAttribute("productStatus"));
//			}
			
			ProductVO productVO = new ProductVO();
			
			productVO.setProduct_name(productName);
			productVO.setProduct_category_id(productCategoryId);
			productVO.setProduct_describtion(productDescribtion);
			productVO.setProduct_price(productPrice);
			productVO.setProduct_status(productStatus);
			
			if(!errorMsgs.isEmpty()) {
				request.setAttribute("productVO", productVO);
				RequestDispatcher failureView = request.getRequestDispatcher("/shop/addProduct.jsp");
				failureView.forward(request, response);
				return;
			}
			
			//**************新增資料**************
			ProductService productSvc = new ProductService();
			productVO = productSvc.addProduct(productCategoryId, productDescribtion, productPrice, productName, productStatus);
			
			//*************新增完成轉交資料***********
			String url = "/shop/listAllProduct.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交
			successView.forward(request, response);	
		}
		
		if("getOne_For_Update".equals(action)) {//來自listAllProduct.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);
			
			//******************接受請求參數******************
			Integer productId = Integer.valueOf(request.getParameter("productId"));
			
			//******************開始查詢資料******************
			ProductService productSvc = new ProductService();
			ProductVO productVO = productSvc.getOneProduct(productId);
			
			//*****************查詢完成，準備繳交***************
			request.setAttribute("productVO", productVO);
			String url = "/shop/update_product_input.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		
		if("update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			//*******************接受參數 -- 輸入格式錯誤處理**************
			Integer productId = Integer.valueOf(request.getParameter("productId").trim());//還未看懂
//			System.out.println(productId);
			
			String productName = request.getParameter("productName");
//			System.out.println(productName);
			String productReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_\\s)]{1,}$";//要注意
			if(productName == null || productName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			}else if(!productName.trim().matches(productReg)) {
				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_");
			}
			
			Integer productCategoryId = null;
			
			try {
				productCategoryId = Integer.valueOf(request.getParameter("productCategoryId").trim());
			}catch (NumberFormatException e) {
				errorMsgs.add("商品類型編號請填數字");
			}
			
			String productDescribtion = request.getParameter("productDescribtion");
//			String productDescribtionReg = ""
			if(productDescribtion == null || productDescribtion.trim().length() == 0) {
				errorMsgs.add("商品內容，請勿空白");
			}
			
			Integer productPrice = null;
			
			try {
				productPrice = Integer.valueOf(request.getParameter("productPrice").trim());
			}catch(NumberFormatException e) {
				errorMsgs.add("商品價格請填數字");
			}
			//要注意 不會
			Boolean productStatus = null;
//			System.out.println(request.getParameter("productStatus").trim());
			if(request.getParameter("productStatus").trim().equals("true")) {
				productStatus = Boolean.valueOf(true);
//				productStatus = true;
//				System.out.println("true");
			}else if(request.getParameter("productStatus").trim().equals("false")) {
//				productStatus = false;
//				System.out.println("false");
				productStatus = Boolean.valueOf(false);
			}
			
//			try{
//				productStatus = Boolean.valueOf(request.getAttribute("productStatus"));
//			}
			
			ProductVO productVO = new ProductVO();
			
			productVO.setProduct_id(productId);
			productVO.setProduct_name(productName);
			productVO.setProduct_category_id(productCategoryId);
			productVO.setProduct_describtion(productDescribtion);
			productVO.setProduct_price(productPrice);
			productVO.setProduct_status(productStatus);
			
			if(!errorMsgs.isEmpty()) {
				request.setAttribute("productVO", productVO);
				RequestDispatcher failureView = request.getRequestDispatcher("/shop/update_product_input.jsp");
				failureView.forward(request, response);
				return;
			}
			//******************開始修改資料*******************
			ProductService productSvc = new ProductService();
			productVO = productSvc.updateproduct(productId, productCategoryId, productDescribtion, productPrice, productName, productStatus);
			//******************修改完成，準備繳交***************
			request.setAttribute("productVO", productVO);
			String url = "/shop/listOneProduct.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		
	}

}
