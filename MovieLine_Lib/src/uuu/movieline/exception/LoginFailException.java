package uuu.movieline.exception;
/**
 * 用login方法代表帳號密碼不正確的登入失敗
 * @author tim
 *
 */
public class LoginFailException extends MLException {

	public LoginFailException() {
		super();
	}

	public LoginFailException(String message, Throwable cause) {
		super(message, cause);
	}

	public LoginFailException(String message) {
		super(message);
	}

}
