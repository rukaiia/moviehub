package com.example.movie.repository;

import com.example.movie.model.Episode;
import com.example.movie.model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EpisodeRepository extends JpaRepository<Episode, Long> {
    List<Episode> findByMovie(Movie movie);
    List<Episode> findByMovieId(Long movieId);

}

