package org.example.pottery_admin_back;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "org.example.pottery_admin_back")
@MapperScan("org.example.pottery_admin_back.mapper")
public class PotteryAdminBackApplication {

	public static void main(String[] args) {
		SpringApplication.run(PotteryAdminBackApplication.class, args);
	}

}
