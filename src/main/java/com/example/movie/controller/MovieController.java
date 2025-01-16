package com.example.movie.controller;

import com.example.movie.model.Episode;
import com.example.movie.model.Movie;
import com.example.movie.service.EpisodeService;
import com.example.movie.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/movies")
public class MovieController {

    private final MovieService movieService;
    private final EpisodeService episodeService;

    private final Path uploadDir = Paths.get("uploads/movies");

    @Autowired
    public MovieController(MovieService movieService, EpisodeService episodeService) throws Exception {
        this.movieService = movieService;
        this.episodeService = episodeService;
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
    }

    @GetMapping
    public String getMovies(Model model, @RequestParam(required = false) String query) {
        model.addAttribute("query", query);
        List<Movie> movies = movieService.findAll();
        model.addAttribute("movies", movies);
        return "movie/movie-list";
    }


    @GetMapping("/{id}")
    public String viewMovie(@PathVariable Long id, Model model) {
        model.addAttribute("movie", Objects.requireNonNull(movieService.getMovieById(id).orElse(null)));
        return "movie/movie-view";
    }





    @GetMapping("/search")
    public String searchMovies(@RequestParam(name = "query", required = false) String query, Model model) {
        if (query != null) {
            List<Movie> movies = movieService.searchMovies(query);
            model.addAttribute("movies", movies);
        } else {
            model.addAttribute("movies", movieService.findAll());
        }
        model.addAttribute("query", query);
        return "movie/movie-list";
    }
    @GetMapping("/{movieId}/episodes")
    public String getEpisodesByMovieId(@PathVariable Long movieId, Model model) {
        List<Episode> episodes = episodeService.getEpisodesByMovieId(movieId);
        Movie movie = movieService.findMovieById(movieId);
        model.addAttribute("movie", movie);

        model.addAttribute("movieTitle", movie.getTitle());
        model.addAttribute("movieDescription", movie.getDescription());
        model.addAttribute("episodes", episodes);
        model.addAttribute("movieId", movieId);
        return "movie/episode-list";
    }

    @GetMapping("/episodes/{episodeId}")
    public String viewEpisode(@PathVariable Long episodeId, Model model) {
        Episode currentEpisode = episodeService.getEpisodeById(episodeId);

        if (currentEpisode == null) {
            return "redirect:/admin";
        }

        List<Episode> allEpisodes = episodeService.findAll();

        int currentIndex = allEpisodes.indexOf(currentEpisode);

        Episode previousEpisode = (currentIndex > 0) ? allEpisodes.get(currentIndex - 1) : null;
        Episode nextEpisode = (currentIndex < allEpisodes.size() - 1) ? allEpisodes.get(currentIndex + 1) : null;

        model.addAttribute("episode", currentEpisode);
        model.addAttribute("previousEpisode", previousEpisode);
        model.addAttribute("nextEpisode", nextEpisode);

        return "movie/episode-view";
    }

}

