package com.abc.BuyerItemservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
@EnableEurekaClient
@SpringBootApplication
public class BuyerItemserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(BuyerItemserviceApplication.class, args);
	}

}
