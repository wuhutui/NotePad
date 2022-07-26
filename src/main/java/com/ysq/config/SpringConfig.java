package com.ysq.config;

import org.apache.ibatis.javassist.ClassPath;
import org.springframework.context.annotation.*;

@Configuration
@ComponentScan({"com.ysq.service","com.ysq.dao"})
@PropertySource(value = "classpath:jdbc.properties")
@Import({JdbcConfig.class,MybatisConfig.class})
public class SpringConfig {
}
