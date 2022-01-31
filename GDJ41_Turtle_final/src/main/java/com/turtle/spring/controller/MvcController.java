package com.turtle.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MvcController {
	
	  @RequestMapping("/") 
	  public String mainPage() { 
		  return "index"; 
	  }
	  
	  @RequestMapping("/main/store") 
	  public String mainStore() { 
		  return "main/store"; 
	  }
	  
	  @RequestMapping("/main/about") 
	  public String mainAbout() { 
		  return "main/about"; 
	  }
}
