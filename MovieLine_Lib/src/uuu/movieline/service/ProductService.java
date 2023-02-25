package uuu.movieline.service;

import java.util.List;

import uuu.movieline.entity.Movie;
import uuu.movieline.exception.MLException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	
	public List<Movie> getAllProducts() throws MLException{
		return dao.selectAllProducts();
	}
	public List<Movie> getProductsByKeyword(String keyword) throws MLException{
		return dao.selectProductsByKeyword(keyword);
	}
	public List<Movie> getProductsByCategory(String category) throws MLException{
		return dao.selectProductsByCategory(category);
	}
	public Movie getProductById(String id) throws MLException{
		return dao.selectProductById(id);
	}
}
