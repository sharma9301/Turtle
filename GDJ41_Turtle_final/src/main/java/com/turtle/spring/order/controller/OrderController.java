package com.turtle.spring.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.order.model.service.OrderService;
import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@Autowired
	private OrderService service;

	@RequestMapping("/member/mypage/delivery")
	public ModelAndView delivery(HttpServletRequest request, ModelAndView mv, String userId) {
		System.out.println("userId들어왔나요" + userId);

		/* String[] orderNoListArr = orderNoList.split(","); */
		/* System.out.println("orderNoListArr : "+orderNoListArr); */
		//System.out.println("orderNoList : " + orderNoList);

		
		//List<OrderDetail> oDList = service.selectODList(userId); 
			/* List oDListCount =service.selectODListCount(userId); */
		 
		List first = service.selectFirst(userId);

		
		/* mv.addObject("oDList", oDList); mv.addObject("oDListCount", oDListCount); */
		 
		/* mv.addObject("orderNoListArr", orderNoListArr); */
		mv.addObject("first", first);
		// mv.addObject("pdList",pdList);
		mv.setViewName("member/mypage/delivery");

		return mv;

	}

	@RequestMapping("/member/mypage/deliveryDetail")
	public ModelAndView deliveryDetail(ModelAndView mv, String userId, String orderNo, String orderDate) {
		System.out.println("유저아이디 : " + userId + "오더넘버 : " + orderNo);
		Map param = new HashMap();
		param.put("orderDate",orderDate);
		param.put("orderNo",orderNo);
		List<Product> pdList = service.selectPDList(param);
		System.out.println("pdList : " + pdList);
		mv.addObject("pdList", pdList);
		mv.setViewName("member/mypage/deliveryDetail");
		return mv;
	}
	
	
	
	@RequestMapping("/member/mypage/orderCancel.do")
	public ModelAndView orderCancel(ModelAndView mv, String orderNo,String userId) {
		
		int result = service.orderCancel(orderNo);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="주문취소 되었습니다.";
			loc="/member/mypage/delivery?userId="+userId;

		}else {
			msg="주문취소 실패! 다시 시도해주세요.";
			loc="/member/mypage/deliveryDetail?userId="+userId;
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/member/mypage/refundRequest.do")
	public ModelAndView refundRequest(ModelAndView mv, String orderNo,String userId) {
		
		int result = service.refundRequest(orderNo);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="환불요청 되었습니다.";
			loc="/member/mypage/delivery?userId="+userId;

		}else {
			msg="환불요청 실패! 다시 시도해주세요.";
			loc="/member/mypage/deliveryDetail";
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

	
	@RequestMapping("/member/mypage/wishList")
	public ModelAndView wishList(ModelAndView mv, String userId) {
		System.out.println("장바구니에 아이디 들어오니"+userId);
		List<Cart> cart = service.selectCart(userId);
		mv.addObject("cart",cart);
		mv.setViewName("member/mypage/wishList");
		return mv;
	}
	
	@RequestMapping("/member/mypage/cartDelete")
	public ModelAndView wishList(ModelAndView mv, int cartNo, String userId) {
		System.out.println("장바구니에 cartNo 들어오니"+cartNo);
		System.out.println("장바구니에 userId 들어오니"+userId);

		int result = service.deleteCart(cartNo);

		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제되었습니다.";
			loc="/member/mypage/wishList?userId="+userId;
		}else {
			msg="다시 시도해주세요.";
			loc="/member/mypage/wishList?userId="+userId;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/mypage/changeAmount")
	public ModelAndView changeAmount(ModelAndView mv,HttpServletRequest request,String updateData) {
		//String updateData =request.getParameter("updateData");
		System.out.println("cart에 updataData 들어오니"+updateData);
		String[] dataArr = updateData.split("/");
		String cartNo = dataArr[0];
		String userId = dataArr[1];
		String amount = dataArr[2];
		
		System.out.println(cartNo);
		System.out.println(userId);
		System.out.println(amount);
		
		Map param = new HashMap();
		param.put("cartNo",cartNo);
		param.put("amount",amount);
		int result = service.updateCart(param);
		System.out.println("param : "+param);
		String msg="";
		String loc="";
		if(result>0) {
			msg="수량이 변경되었습니다.";
			loc="/member/mypage/wishList?userId="+userId;
		}else {
			msg="수량변경 실패! 다시 시도해주세요.";
			loc="/member/mypage/wishList?userId="+userId;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	

	@RequestMapping("/member/mypage/reviews")
	public ModelAndView reviews(ModelAndView mv, String userId) {
		System.out.println("리뷰에 userId = " + userId);
		
		List<Reviews> reviews = service.selectReviews(userId);
		List<OrderDetail> notYet = service.selectNotYet(userId);
		
		mv.addObject("notYet",notYet);
		mv.addObject("reviews",reviews);
		mv.setViewName("member/mypage/reviews");
		
		return mv;
	}	

	@RequestMapping("/member/deleteRv.do")
	public ModelAndView reviews(ModelAndView mv, int detailNo,String userId) {
		System.out.println("리뷰삭제에 detailNo = " + detailNo);
		
		int delete = service.deleteRv(detailNo);
		int update = service.updateRvYn(detailNo);
		String msg = "";
		String loc = "";
		if(delete>0 && update>0) {
			msg="리뷰가 삭제되었습니다.";
			loc="/member/mypage/reviews?userId="+userId;
		}else {
			msg="다시 시도하세요.";
			loc="/member/mypage/reviews?userId="+userId;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}	
	
	
	
	
	
	
	

}
