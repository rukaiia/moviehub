package com.example.movie.controller;

import com.example.movie.dto.UserDto;
import com.example.movie.model.Episode;
import com.example.movie.model.Movie;

import com.example.movie.service.EpisodeService;
import com.example.movie.service.MovieService;
import com.example.movie.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import com.example.movie.dto.EpisodeDto;


@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;
    private final MovieService movieService;
    private final EpisodeService episodeService;
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "auth/adminregister";
    }

    @PostMapping("/register")
    public String register(@Valid UserDto userDto, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "auth/adminregister";
        }

        if (userService.checkIfUserExists(userDto.getEmail())) {
            bindingResult.rejectValue("email", "error.userDto", "Пользователь с таким email уже существует.");
            return "auth/adminregister";
        }

        userService.createAdmin(userDto);

        redirectAttributes.addFlashAttribute("successMessage", "Регистрация прошла успешно! Ваш билет: " );

        return "redirect:/admin";
    }
    @GetMapping
    public String getMovies(Model model, @RequestParam(required = false) String query) {
        model.addAttribute("query", query);
        List<Movie> movies = movieService.findAll();
        model.addAttribute("movies", movies);
        return "admin/adminpage";


    }
    @GetMapping("/{id}")
    public String viewMovie(@PathVariable Long id, Model model) {
        model.addAttribute("movie", Objects.requireNonNull(movieService.getMovieById(id).orElse(null)));
        return "admin/movie-view";
    }
    @GetMapping("/upload")
    public String showUploadForm() {
        return "admin/movie-upload";
    }
    @PostMapping("/upload")
    public String uploadMovie(@RequestParam("title") String title,
                              @RequestParam("description") String description,
                              @RequestParam("genre") String genre,
                              @RequestParam("file") MultipartFile file,
                              @RequestParam("image") MultipartFile image) throws Exception {
        String fileName = UUID.randomUUID() + "-" + file.getOriginalFilename();
        Path uploadDir = Paths.get("uploads/movies");
        if (Files.notExists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
        Path filePath = uploadDir.resolve(fileName);
        Files.copy(file.getInputStream(), filePath);

        String imageName = UUID.randomUUID() + "-" + image.getOriginalFilename();
        Path imageDir = Paths.get("uploads/images");
        if (Files.notExists(imageDir)) {
            Files.createDirectories(imageDir);
        }
        Path imagePath = imageDir.resolve(imageName);
        Files.copy(image.getInputStream(), imagePath);

        Movie movie = new Movie();
        movie.setTitle(title);
        movie.setDescription(description);
        movie.setGenre(genre);
        movie.setFilePath(uploadDir.relativize(filePath).toString());
        movie.setImagePath(imageDir.relativize(imagePath).toString());

        movieService.saveMovie(movie);
        return "redirect:/admin";
    }


    @PostMapping("/delete/{id}")
    public String deleteMovie(@PathVariable Long id) throws Exception {
        Movie movie = movieService.getMovieById(id).orElseThrow(() -> new Exception("Movie not found"));

        Path filePath = Paths.get(movie.getFilePath());
        Files.deleteIfExists(filePath);

        movieService.deleteMovie(id);
        

        return "redirect:/admin";
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
        return "admin/adminpage";
    }
//    @GetMapping("/{id}/episodes")
//    public String viewEpisodes(@PathVariable Long id, Model model) {
//        Movie movie = movieService.findMovieById(id);
//        if (movie == null) {
//            return "redirect:/admin";
//        }
//
//        List<Episode> episodes = episodeService.findEpisodesByMovie(movie);
//        model.addAttribute("movie", movie);
//        model.addAttribute("episodes", episodes);
//
//        return "admin/episode-list";
//    }
    @GetMapping("/movies/{movieId}/episodes")
    public String getEpisodesByMovieId(@PathVariable Long movieId, Model model) {
        List<Episode> episodes = episodeService.getEpisodesByMovieId(movieId);
        Movie movie = movieService.findMovieById(movieId);
        model.addAttribute("movie", movie);

        model.addAttribute("movieTitle", movie.getTitle());
        model.addAttribute("movieDescription", movie.getDescription());
        model.addAttribute("episodes", episodes);
        model.addAttribute("movieId", movieId);
        return "admin/episode-list";
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

        return "admin/episode-view";
    }


    @GetMapping("/movies/{movieId}/episodes/add")
    public String showAddEpisodeForm(@PathVariable Long movieId, Model model) {
        Movie movie = movieService.findMovieById(movieId);

        model.addAttribute("movieTitle", movie.getTitle());

        model.addAttribute("movieId", movieId);
        model.addAttribute("episode", new EpisodeDto());

        return "admin/add-episode";
    }


        @PostMapping("/{movieId}/episodes/add")
        public String addEpisodeToMovie(@PathVariable Long movieId,
                                        @RequestParam("title") String title,
//                                        @RequestParam("description") String description,
                                        @RequestParam("file") MultipartFile file) throws Exception {
            String fileName = UUID.randomUUID() + "-" + file.getOriginalFilename();
//            String imageName = UUID.randomUUID() + "-" + image.getOriginalFilename();

            Path uploadDir = Paths.get("uploads/movies");
            if (Files.notExists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }
            Path filePath = uploadDir.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);

            Path imageDir = Paths.get("uploads/images");
            if (Files.notExists(imageDir)) {
                Files.createDirectories(imageDir);
            }
//            Path imagePath = imageDir.resolve(imageName);
//            Files.copy(image.getInputStream(), imagePath);

            Movie movie = movieService.getMovieById(movieId)
                    .orElseThrow(() -> new RuntimeException("Movie not found"));

            Episode episode = new Episode();
            episode.setTitle(title);
//            episode.setDescription(description);
            episode.setFilePath(uploadDir.relativize(filePath).toString());
//            episode.setImagePath(imageDir.relativize(imagePath).toString());
            episode.setMovie(movie);

            episodeService.saveEpisode(episode);

            return "redirect:/admin/movies/" + movieId + "/episodes";
        }
    }





