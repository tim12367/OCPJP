package uuu.movieline.exception;

public class MLInvalidDataException extends RuntimeException {

	public MLInvalidDataException() {
		super();
	}
	//兩個引數 多了拋出底層原始錯誤
	public MLInvalidDataException(String message, Throwable cause) {
		super(message, cause);
	}

	public MLInvalidDataException(String message) {
		super(message);
	}

}
