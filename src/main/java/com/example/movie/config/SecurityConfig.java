package com.example.movie.config;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
                .httpBasic(Customizer.withDefaults())
                .formLogin(form ->
                        form.loginPage("/auth/login")
                                .loginProcessingUrl("/auth/login")
                                .successHandler((request, response, authentication) -> {
                                    boolean isAdmin = authentication.getAuthorities().stream()
                                            .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_ADMIN"));

                                    if (isAdmin) {
                                        response.sendRedirect("/admin");
                                    } else {
                                        response.sendRedirect("/movies");
                                    }
                                })
                                .failureUrl("/auth/login?error=true")
                                .permitAll()
                )
                .logout(logout -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout")).permitAll())
                .authorizeHttpRequests(authorizeRequests -> authorizeRequests
                        .requestMatchers("/admin").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/delete").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/upload").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/movies/**").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/news").permitAll()
                        .requestMatchers("/notes").permitAll()
                        .requestMatchers("/auth/register").permitAll()
                        .requestMatchers("/uploads/movies/uploads","/posts/delete").permitAll()
                        .requestMatchers("/posts/delete", "/profile","/posts/delete","/notes/edit", "/comment", "/notes/create").authenticated()
                        .anyRequest().permitAll()
                );

        return http.build();
    }


    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }


}
