package com.turtle.spring.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	
	private String userId;
	private String userName;
	private String email;
	private String enrollType;
	private String password;
	private String phone;
	private String address;
	private Date enrollDate;
	
}
