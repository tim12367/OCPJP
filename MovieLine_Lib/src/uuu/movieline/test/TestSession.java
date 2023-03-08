package uuu.movieline.test;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;

public class TestSession {

	public static void main(String[] args) {
		MovieSession session = new MovieSession();
		session.setMovie(new Movie());
		session.getMovie().setId(123);
		System.out.println(session.getMovie().getId());
			
	}

}
