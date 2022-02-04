package com.turtle.spring.product.model.vo;

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
public class Product {
	private String pdCode;
	private Category categoryCode;
	private String pdName;
	private int pdPrice;
	private Date pdDate;
	private String pdIsDiscount;
	private double pdDiscountrate;
	private String pdIsDisplay;
	private String pdImage;
	
		
}
