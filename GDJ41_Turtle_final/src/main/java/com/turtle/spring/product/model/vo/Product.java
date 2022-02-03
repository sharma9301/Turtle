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
	private int pdPrice;
	private Date pdDate;
	private String pdIsDiscount;
	private double pdDiscountRate;
	private String pdIsDisplay;
	private String pdImage;
		
}
