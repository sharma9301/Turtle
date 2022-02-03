package com.turtle.spring.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Option {

	private String optName;
	private Product pdCode;
	private String matarial;
	private String color;
	private String weight;
	private String size;
	private int stock;
	
	
	
}
