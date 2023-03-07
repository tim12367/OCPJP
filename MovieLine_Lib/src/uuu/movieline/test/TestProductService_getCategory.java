package uuu.movieline.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Movie;
import uuu.movieline.service.ProductService;

public class TestProductService_getCategory {

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
			List<String[]> list = service.getMovieCategoryList();
			for(int i =0;i<list.size();i++) {
				System.out.println(list.get(i)[0]+list.get(i)[1]);
			}
			
		} catch (Exception e) {
			Logger.getLogger("測試[獲得分類]").log(
					Level.SEVERE,e.getMessage(),e);
		}

	}

}
