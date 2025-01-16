package com.example.movie.service;

import com.example.movie.dto.EpisodeDto;
import com.example.movie.model.Episode;
import com.example.movie.model.Movie;
import com.example.movie.repository.EpisodeRepository;
import com.example.movie.repository.MovieRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EpisodeService {

    private final EpisodeRepository episodeRepository;
    private final MovieRepository movieRepository;

    public EpisodeService(EpisodeRepository episodeRepository, MovieRepository movieRepository) {
        this.episodeRepository = episodeRepository;
        this.movieRepository = movieRepository;
    }

    public List<Episode> findEpisodesByMovie(Movie movie) {
        return episodeRepository.findByMovie(movie);
    }

    public Episode getEpisodeById(Long id) {
        return episodeRepository.findById(id).orElse(null);
    }

    public Episode saveEpisode(Episode episode) {
        return episodeRepository.save(episode);
    }
    public List<Episode> getEpisodesByMovieId(Long movieId) {
        return episodeRepository.findByMovieId(movieId);
    }

    public void addEpisodeToMovie(Long movieId, EpisodeDto episodeDTO) {
        Movie movie = movieRepository.findById(movieId)
                .orElseThrow(() -> new RuntimeException("Movie not found"));
        Episode episode = new Episode();
        episode.setTitle(episodeDTO.getTitle());
        episode.setMovie(movie);
        episodeRepository.save(episode);
    }

    public List<Episode> findAll() {
        return episodeRepository.findAll();
    }
}

