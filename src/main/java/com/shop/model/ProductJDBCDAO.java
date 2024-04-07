package com.shop.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductJDBCDAO implements ProductDAO_interface{
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cactus?serverTimezone=Asia/Taipei";
//	String url = "jdbc:mysql://localhost:3306?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String userid = "root";
	String password = "Ab22587899@";
	
	private static final String INSERT_PRODUCT =
			"insert into product (product_category_id, product_describtion, product_price, product_name, product_status) values (?, ?, ?, ?, ?)";
	
	private static final String GET_ALL_PRODUCT = 
			"SELECT * FROM product";
	
	private static final String GET_ONE_PRODUCT = 
			"SELECT * FROM product where product_id = ?";
	
	private static final String UPDATE = 
			"UPDATE product set product_category_id=?, product_describtion=?, product_price=?, product_name=?, product_status=? where product_id=?";

	@Override
	public void insert(ProductVO productVO) {
		try (Connection connection = DriverManager.getConnection(url, userid, password);
				PreparedStatement ps = connection.prepareStatement(INSERT_PRODUCT)) {
//			System.out.println("Connecting to MySQL successfully!!");
			ps.setInt(1, productVO.getProduct_category_id());
			ps.setString(2, productVO.getProduct_describtion());
			ps.setInt(3, productVO.getProduct_price());
			ps.setString(4, productVO.getProduct_name());
			ps.setBoolean(5, productVO.getProduct_status());
			
			 ps.executeUpdate();
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void update(ProductVO productVO) {
		try (Connection connection = DriverManager.getConnection(url, userid, password);
				PreparedStatement ps = connection.prepareStatement(UPDATE)){
				
			ps.setInt(1, productVO.getProduct_category_id());
			ps.setString(2, productVO.getProduct_describtion());
			ps.setInt(3, productVO.getProduct_price());
			ps.setString(4, productVO.getProduct_name());
			ps.setBoolean(5, productVO.getProduct_status());
			ps.setInt(6, productVO.getProduct_id());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(Integer product_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductVO findByPrimaryKey(Integer product_id) {
		ProductVO product = null;
		
		try (Connection connection = DriverManager.getConnection(url, userid, password);
				PreparedStatement ps = connection.prepareStatement(GET_ONE_PRODUCT)){
			ps.setInt(1, product_id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				product = new ProductVO();
				
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_category_id(rs.getInt("product_category_id"));
				product.setProduct_describtion(rs.getString("product_describtion"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_status(rs.getBoolean("product_status"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = new ArrayList<>();
		
		ProductVO product = null;
		
		try (Connection connection = DriverManager.getConnection(url, userid, password);
				PreparedStatement ps = connection.prepareStatement(GET_ALL_PRODUCT)){
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				product = new ProductVO();
				
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_category_id(rs.getInt("product_category_id"));
				product.setProduct_describtion(rs.getString("product_describtion"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_status(rs.getBoolean("product_status"));
				
				list.add(product);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
		
	
		
		
		
	}
	
