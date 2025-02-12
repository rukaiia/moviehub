package com.example.movie.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(length = 500)
    private String description;

    @Column(nullable = false)
    private String filePath;
    private String genre;
    private String imagePath;
    @OneToMany(mappedBy = "movie", cascade = CascadeType.ALL)
    private List<Episode> episodes = new ArrayList<>();


}

