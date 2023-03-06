package uuu.movieline.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Movie;
import uuu.movieline.service.ProductService;

public class TestProductService_getAll {

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
			List<Movie> list = service.getMoviesByKeyword("水");
			System.out.println(list);
		} catch (Exception e) {
			Logger.getLogger("測試[查詢產品]").log(
					Level.SEVERE,e.getMessage(),e);
		}

	}

}
