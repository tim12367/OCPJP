package uuu.movieline.service;

import uuu.movieline.entity.Customer;

public class CustomerService {
	private CustomersDAO dao = new CustomersDAO();
	
	public Customer login(String idOrEmail, String password) {
		if(idOrEmail == null||idOrEmail.length()==0
				||password == null||password.length() == 0) {
			throw new IllegalArgumentException("登入時帳號密碼必須有值");
		}
		Customer c = dao.selectCustomerById(idOrEmail);
		
		if(c!=null&& c.getPassword().equals(password)) {
			return c;
		}
		
		throw new RuntimeException("登入失敗!帳號或密碼不正確");
	}
}
