package cn.asens;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

/**
 * @author Asens
 * create 2018-05-05 22:36
 **/
@SpringBootApplication
@EnableMongoRepositories(basePackages = "cn.asens.dao")
public class Application {
    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class, args);
    }
}
