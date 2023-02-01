package uuu.movieline.exception;

public class MLInvalidDataException extends RuntimeException {

	public MLInvalidDataException() {
		super();
	}

	public MLInvalidDataException(String message, Throwable cause) {
		super(message, cause);
	}

	public MLInvalidDataException(String message) {
		super(message);
	}

}
