package spring.configuration;

import java.util.Properties;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
@ComponentScans({ @ComponentScan("spring") })  // spring.controller // quét qua những package nào cần sử dụng đến spring
@EnableWebMvc   // kích hoạt ứng dung spring mvc
public class AppConfig {
	
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(1);
		return viewResolver;
	}
	@Bean(name = "multipartResolver")
	public MultipartResolver getMultipartResolver() {
	CommonsMultipartResolver resover = new CommonsMultipartResolver();
	return resover;
	}
	
	@Bean
	public MessageSource messageSource() {
	ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
	messageSource.setBasenames("messages/validator", "messages/success", "messages/validatorForm", "messages/application");
	messageSource.setDefaultEncoding("UTF-8");
	return messageSource;
	}
	
	@Bean(name = "viewResolverTiles")
	public ViewResolver getViewResolverTiles() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(TilesView.class);
		viewResolver.setOrder(0);
		return viewResolver;
	}
	@Bean(name = "tilesConfigurer")
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions("/WEB-INF/templates/tiles-cland.xml");
		return tilesConfigurer;
	}
	
	/*
	 * @Bean public JavaMailSender getMailSender() { JavaMailSenderImpl mailSender =
	 * new JavaMailSenderImpl(); mailSender.setHost("smtp.gmail.com");
	 * mailSender.setPort(587); mailSender.setUsername("minhhaihai96@gmail.com");
	 * mailSender.setPassword("16102002a");
	 * 
	 * Properties javaMailProperties = new Properties();
	 * javaMailProperties.put("mail.smtp.starttls.enable", "true");
	 * javaMailProperties.put("mail.smtp.auth", "true");
	 * javaMailProperties.put("mail.transport.protocol", "smtp");
	 * javaMailProperties.put("mail.debug", "true");
	 * 
	 * mailSender.setJavaMailProperties(javaMailProperties); return mailSender; }
	 */
	
	@Bean
	public JavaMailSender getJavaMailSender() {
	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);
	    
	    mailSender.setUsername("minhhaihai96");
	    mailSender.setPassword("16102002a");
	    
	    Properties props = mailSender.getJavaMailProperties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
	    
	    return mailSender;
	}
	
}
