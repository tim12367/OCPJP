package uuu.movieline.test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.service.ProductService;

public class TestProductService_getSessionByMovieId {

	public static void main(String[] args) {
		ProductService service =new ProductService();
		
//		try {
//			List<Product> list = service.getAllProducts();
//			System.out.println(list);
//		} catch (Exception e) {
//			Logger.getLogger("測試[全部產品]").log(
//					Level.SEVERE,e.getMessage(),e);
//		}
		//用名子查詢
		try {
			List<MovieSession> list = service.getSessionsByMovieId("1");
//			System.out.println(list);
			List<MovieSession> selectByDatelist = new ArrayList<>();
			for(MovieSession i:list) {
				if (i.getDate().equals(LocalDate.parse("2023-03-01"))) {
					selectByDatelist.add(i);
				}
			}
			System.out.println(selectByDatelist);
		} catch (Exception e) {
			Logger.getLogger("測試[id查詢]").log(
					Level.SEVERE,e.getMessage(),e);
		}

	}

}
