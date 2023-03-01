package uuu.movieline.service;

import java.util.List;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
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
	public List<String[]> getMovieCategoryGroupByCategory() throws MLException {
		return dao.selectMovieCategoryGroupByCategory();
	}
	public List<MovieSession> getSessionsByMovieId(String id) throws MLException{
		return dao.selectSessionsByMovieId(id);
	}
	public List<MovieSession> getSessionsByMovieIdDate(String id,String date) throws MLException{
		return dao.selectSessionsByMovieIdDate(id,date);
	}
}
