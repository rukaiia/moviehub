package com.example.movie.controller;

import com.example.movie.dto.UserDto;
import com.example.movie.model.Movie;

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

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;
    private final MovieService movieService;
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




}
