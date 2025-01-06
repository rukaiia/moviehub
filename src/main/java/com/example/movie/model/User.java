package com.example.movie.model;


import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String email;
    private String password;
    private boolean enabled;
    private String resetPasswordToken;

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "role_id")
    private Role role;
//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<Note> notes = new ArrayList<>();



}
