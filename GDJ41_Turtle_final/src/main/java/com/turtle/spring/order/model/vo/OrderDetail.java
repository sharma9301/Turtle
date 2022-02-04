package com.turtle.spring.order.model.vo;

import java.sql.Date;

import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDetail {
	
	private int orderDetailNo;
	private Product orderNo;
	private Option optNo;
	private Date orderDate;
	private String rcName;
	private String rcPhone;
	private String rcAddress;
	private String Method;
	private String invoice;

}