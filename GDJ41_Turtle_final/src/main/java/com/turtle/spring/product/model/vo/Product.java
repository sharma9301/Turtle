package com.turtle.spring.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	
	private String pdCode;
	private Category categoryCode;
	private String pdName;
	private int price;
	private Date pdDate;
	private String discount;
	private double discountRate;
	private String display;
	private String pdImage;
		
}
