package com.example.movie.service;

import com.example.movie.model.Movie;
import com.example.movie.repository.MovieRepository;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class MovieService {

    private final MovieRepository movieRepository;

    public MovieService(MovieRepository movieRepository) {
        this.movieRepository = movieRepository;
    }

    public List<Movie> getAllMovies() {
        return movieRepository.findAll();
    }

    public Optional<Movie> getMovieById(Long id) {
        return movieRepository.findById(id);
    }

    public Movie saveMovie(Movie movie) {
        return movieRepository.save(movie);
    }

    public void deleteMovie(Long id) {
        movieRepository.deleteById(id);
    }

    public List<Movie> searchMovies(String query) {
        return movieRepository.findByTitleContainingIgnoreCaseOrGenreContainingIgnoreCase(query, query);
    }


    public List<Movie> findAll() {
        return movieRepository.findAll();
    }
    public List<Movie> findByQuery(String query) {
        if (query != null && !query.isEmpty()) {
            return movieRepository.findByTitleContaining(query);
        }
        return Collections.emptyList();

    }



}

