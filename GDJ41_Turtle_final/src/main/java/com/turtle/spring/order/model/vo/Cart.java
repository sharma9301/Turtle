package com.turtle.spring.order.model.vo;

import java.sql.Date;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	
	private int rvNO;
	private Product pdCode;
	private Member userId;
	private String rvGrade;
	private String rvTitle;
	private String rvContent;
	private Date rvDate;
	private String rvImage;
	private String rvIsImage;
	
	
	
}
