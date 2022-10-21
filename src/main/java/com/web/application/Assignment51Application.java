package com.web.application;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Assignment51Application {

	public static void main(String[] args) throws IOException {
		SpringApplication.run(Assignment51Application.class, args);
		Runtime rt = Runtime.getRuntime();
	    rt.exec("rundll32 url.dll,FileProtocolHandler " + "http://localhost:8081/home");
	}

}
