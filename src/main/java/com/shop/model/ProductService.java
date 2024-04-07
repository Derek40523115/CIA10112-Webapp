package com.shop.model;

import java.util.List;

public class ProductService {
	private ProductDAO_interface dao;
	
	public ProductService() {
		dao = new ProductJDBCDAO();
	}
	
	public ProductVO addProduct(Integer productCategoryId, String productDescribtion, Integer productPrice, String productName, Boolean productStatus) {
		ProductVO productVO = new ProductVO();
		
		productVO.setProduct_category_id(productCategoryId);
		productVO.setProduct_describtion(productDescribtion);
		productVO.setProduct_price(productPrice);
		productVO.setProduct_name(productName);
		productVO.setProduct_status(productStatus);
		
		dao.insert(productVO);
		
		return productVO;
	}
	
//	public ProductVO updateProduct()
	
	public ProductVO getOneProduct(Integer productId) {
		return dao.findByPrimaryKey(productId);
	}
	
	public List<ProductVO> getAll(){
		return dao.getAll();
	}
}
