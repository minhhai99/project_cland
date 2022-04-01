package spring.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/publicUrl/**").addResourceLocations("/WEB-INF/resources/public/");
		registry.addResourceHandler("/adminUrl/**").addResourceLocations("/WEB-INF/resources/admin/");
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/");
	}
}
