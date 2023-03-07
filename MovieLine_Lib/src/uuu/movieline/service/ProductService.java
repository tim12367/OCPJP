package uuu.movieline.service;

import java.util.List;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.exception.MLException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	
	public List<Movie> getAllMovies() throws MLException{
		return dao.selectAllMovies();
	}
	public List<Movie> getMoviesByKeyword(String keyword) throws MLException{
		if(keyword==null) throw new IllegalArgumentException("依關鍵字查詢電影keyword不得為null");
		return dao.selectMoviesByKeyword(keyword);
	}
	public List<Movie> getMoviesByCategory(String category) throws MLException{
		if(category==null) throw new IllegalArgumentException("依電影分類查詢電影category不得為null");
		return dao.selectMoviesByCategory(category);
	}
	public Movie getMovieById(String id) throws MLException{
		if(id==null) throw new IllegalArgumentException("依電影id查詢電影id不得為null");
		return dao.selectMovieById(id);
	}
	public List<String[]> getMovieCategoryList() throws MLException {
		return dao.selectMovieCategoryGroupByCategory();
	}
	public List<MovieSession> getSessionsByMovieId(String id) throws MLException{
		if(id==null) throw new IllegalArgumentException("查詢電影場次時，movieId不得為null");
		return dao.selectSessionsByMovieId(id);
	}
	public List<MovieSession> getSessionsByMovieIdDate(String id,String date) throws MLException{
		if(id==null) throw new IllegalArgumentException("查詢電影場次時，movieId不得為null");
		if(date==null) throw new IllegalArgumentException("查詢電影場次時，date不得為null");
		return dao.selectSessionsByMovieIdDate(id,date);
	}
	public MovieSession getSessionsByMovieIdDatetime(String id,String date,String time) throws MLException{
		if(id==null) throw new IllegalArgumentException("查詢電影場次時，movieId不得為null");
		if(date==null) throw new IllegalArgumentException("查詢電影場次時，date不得為null");
		if(time==null) throw new IllegalArgumentException("查詢電影場次時，time不得為null");		
		return dao.selectSessionsByMovieIdDatetime(id,date,time);
	}
}
