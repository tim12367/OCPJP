package uuu.movieline.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Movie;
import uuu.movieline.service.ProductService;

public class TestProductService_getById {

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
			Movie p = service.getMovieById("1");
			System.out.println(p);
		} catch (Exception e) {
			Logger.getLogger("測試[id查詢]").log(
					Level.SEVERE,e.getMessage(),e);
		}

	}

}
