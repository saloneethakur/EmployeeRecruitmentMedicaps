package com.EmployeeRecruitmentMedicaps.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.EmployeeRecruitmentMedicaps.services.UserService;



@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter 
{

	@Autowired
	private UserService userService;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
		 	http.csrf().disable();
		
	        http.authorizeRequests()        
	        .antMatchers("/").permitAll()
	        .antMatchers("/medicaps/**").permitAll()
	                
	        .antMatchers("/user/**").hasRole("USER")	
	        .antMatchers("/user/**").hasRole("USER")
	        .antMatchers("/user/**").hasAnyRole("ADMIN","USER")
	        .and()        
	        .formLogin().loginPage("/medicaps/login").permitAll()
	        .defaultSuccessUrl("/medicaps/home").usernameParameter("email")
	        .and()
	        .exceptionHandling().accessDeniedPage("/web/accessDenied").and()
	        .logout().logoutRequestMatcher(new AntPathRequestMatcher("/medicaps/logout")).logoutSuccessUrl("/medicaps/register")
	        .and().httpBasic();		
	}
	/* @Bean
	    public PasswordEncoder getPasswordEncoder() {
	        return NoOpPasswordEncoder.getInstance();
	    }*/
}

