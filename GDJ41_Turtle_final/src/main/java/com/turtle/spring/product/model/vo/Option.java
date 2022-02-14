package com.turtle.spring.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class Option {

	private String optNo;
	private Product pdCode;
	private String material;
	private String color;
	private String weight;
	private int size;
	private int stock;
	
	
	
}
