package com.turtle.spring.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
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
