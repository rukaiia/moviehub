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
                                .defaultSuccessUrl("/notes")
                                .failureUrl("/auth/login?error=true")
                                .permitAll())
                .logout(logout -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout")).permitAll())
                .authorizeHttpRequests(authorizeRequests -> authorizeRequests
//                        .requestMatchers("/admin/register").permitAll()
                        .requestMatchers("/admin").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/adminposts").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/news/create").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/news/delete").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/news").permitAll()
                        .requestMatchers("/notes").permitAll()
                        .requestMatchers("/auth/register").permitAll()
                        .requestMatchers("/comment","/posts/delete").permitAll()
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
