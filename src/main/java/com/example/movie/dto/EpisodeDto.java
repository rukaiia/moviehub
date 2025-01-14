package com.example.movie.dto;

import com.example.movie.model.Movie;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EpisodeDto {
    private Long id;
    private String title;
    private String filePath;
    private Movie movie;

}
