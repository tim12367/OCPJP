package uuu.movieline.service;

import java.util.List;

import uuu.movieline.entity.Product;
import uuu.movieline.exception.MLException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	
	public List<Product> getAllProducts() throws MLException{
		return dao.selectAllProducts();
	}
	public List<Product> getProductsByKeyword(String keyword) throws MLException{
		return dao.selectProductsByKeyword(keyword);
	}
	public List<Product> getProductsByCategory(String category) throws MLException{
		return dao.selectProductsByCategory(category);
	}
	public Product getProductById(String id) throws MLException{
		return dao.selectProductById(id);
	}
}
