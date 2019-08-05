package com.bitcamp.conf;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class DBConf {
	@Value("#{dbinfo['db.driver']}")
	private String driver;
	
	@Value("#{dbinfo['db.url']}")
	private String url;
	
	@Value("#{dbinfo['db.user']}")
	private String user;
	
	@Value("#{dbinfo['db.pwd']}")
	private String pwd;
	
	@Bean
	public DataSource dataSource() {
		HikariConfig confg = new HikariConfig();
		confg.setDriverClassName(driver);
		confg.setJdbcUrl(url);
		confg.setUsername(user);
		confg.setPassword(pwd);
		HikariDataSource ds = new HikariDataSource(confg);
		return ds;
	}
	
	@Bean
	public SqlSessionFactoryBean fact() {
		SqlSessionFactoryBean fact = new SqlSessionFactoryBean();
		fact.setDataSource(dataSource());
		
		/*Resource[] res = new Resource[1];
		res[0] = new ClassPathResource("mapper/emp.xml");  
		fact.setMapperLocations(res);*/
		fact.setMapperLocations(new Resource[] {new ClassPathResource("mapper/mapper.xml")});
		return fact;
	}
	/*String resource = "config/db.properties";
	Properties properties = new Properties();
	try {
		Reader reader = Resources.getResourceAsReader(resource);
		properties.load(reader);
	} catch (IOException e) {
		e.printStackTrace();
	}*/
	
}
