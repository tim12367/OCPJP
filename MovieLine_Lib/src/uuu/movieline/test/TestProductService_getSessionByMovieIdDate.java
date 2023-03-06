package uuu.movieline.test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.service.ProductService;

public class TestProductService_getSessionByMovieIdDate {

	public static void main(String[] args) {
		ProductService service =new ProductService();
		
		//用movieid date time查詢
		try {
			List<MovieSession> list  = service.getSessionsByMovieIdDate("6","undefined");
			System.out.println(list);
		} catch (Exception e) {
			Logger.getLogger("測試[id,date查詢]").log(
					Level.SEVERE,e.getMessage(),e);
		}

	}

}
