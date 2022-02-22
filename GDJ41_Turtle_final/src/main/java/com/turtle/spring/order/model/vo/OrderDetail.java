package com.turtle.spring.order.model.vo;

import java.sql.Date;

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
@Getter
@Setter
public class OrderDetail {
	
	private int orderDetailNo;
	private Order orderNo;
	private Option optNo;
	private int orderAmount;
	private String orderStatus;
	private String rvYn;


}
