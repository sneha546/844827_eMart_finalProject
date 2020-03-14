package com.abc.BuyerSignupService.controller;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.abc.BuyerSignupService.model.BuyerSignupPojo;
import com.abc.BuyerSignupService.service.BuyerSignupService;



@CrossOrigin
@RestController
@RequestMapping("emart")
public class BuyerSignupController {
static Logger LOG = Logger.getLogger(BuyerSignupController.class.getClass());
	
	@Autowired
	BuyerSignupService buyerSignup;
	
	//end point for adding bills
	
	@PostMapping("/buyer")
	
	//addBill method requesting for bills

	BuyerSignupPojo addBuyer(@RequestBody BuyerSignupPojo buyerPojo)
	{
		BasicConfigurator.configure();
		LOG.info("entered controller add buyer");

		System.out.println("pojo:" + buyerPojo);
		LOG.info("exited controller add buyer");
		return buyerSignup.addBuyer(buyerPojo);
	}
	
	
	

}
