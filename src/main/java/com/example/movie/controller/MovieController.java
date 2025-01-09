package com.example.movie.controller;

import com.example.movie.model.Movie;
import com.example.movie.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequestMapping("/movies")
public class MovieController {

    private final MovieService movieService;
    private final Path uploadDir = Paths.get("uploads/movies");

    @Autowired
    public MovieController(MovieService movieService) throws Exception {
        this.movieService = movieService;
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


}

