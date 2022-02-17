package com.turtle.spring.order.model.vo;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Option;

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
@Setter
@Getter
public class Cart {
	
	private int cartNo;
	private Member userId;
	private Option optNo;
	private int amount;
	
	
	
}
