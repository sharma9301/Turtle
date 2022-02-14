package com.turtle.spring.order.model.vo;

import java.sql.Date;

import com.turtle.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {
	
	private String orderNo;
	private Member userId;
	private Date orderDate;
	private String rcName;
	private String rcPhone;
	private String rcAddress;
	private String method;
	private int totalPrice;
	private String invoice;

}
