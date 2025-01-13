package com.example.movie.repository;

import com.example.movie.model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MovieRepository extends JpaRepository<Movie, Long> {
    List<Movie> findByTitleContainingIgnoreCaseOrGenreContainingIgnoreCase(String title, String genre);

    List<Movie> findByTitleContaining(String title);

    @Query("SELECT DISTINCT m.genre FROM Movie m")
    List<String> findDistinctGenres();

    List<Movie> findByGenre(String genre);
}
