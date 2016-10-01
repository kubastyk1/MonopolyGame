package com.JStudio.Monopoly.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http
			.formLogin()
				.loginPage("/Monopoly/login")
			.and()
				.logout()
					.logoutSuccessUrl("/")
			.and()
			.rememberMe()
				.tokenValiditySeconds(2419200)
				.key("monopolyKey")
			.and()
			.authorizeRequests()
				.antMatchers("/").authenticated()
				.anyRequest().permitAll();
		/*	.and()
			.requiresChannel()
				.antMatchers("/Monopoly/login").requiresSecure();*/
	}
	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
			.withUser("admin").password("admin").roles("USER", "ADMIN").and()
			.withUser("user1").password("pass1").roles("USER").and()
			.withUser("user2").password("pass2").roles("USER").and()
			.withUser("user3").password("pass3").roles("USER").and()
			.withUser("user4").password("pass4").roles("USER").and();
	}
}
