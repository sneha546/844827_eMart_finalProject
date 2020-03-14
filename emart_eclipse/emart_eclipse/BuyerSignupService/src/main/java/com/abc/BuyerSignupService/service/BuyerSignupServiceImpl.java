package com.abc.BuyerSignupService.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.abc.BuyerSignupService.dao.BuyerSignupDao;
import com.abc.BuyerSignupService.entity.BuyerSignupEntity;
import com.abc.BuyerSignupService.model.BuyerSignupPojo;

@Service
public class BuyerSignupServiceImpl implements BuyerSignupService{
	
	static Logger LOG = Logger.getLogger(BuyerSignupServiceImpl.class.getClass());
	@Autowired
	BuyerSignupDao buyerDao;
	@Override
	public BuyerSignupPojo addBuyer(BuyerSignupPojo buyerPojo) {
		LOG.info("entered addBuyer()");
		BuyerSignupEntity buyerSignupEntity = new BuyerSignupEntity(buyerPojo.getBuyerId(),
															buyerPojo.getBuyerUsername(),
															buyerPojo.getBuyerPassword(),
															buyerPojo.getBuyerEmail(),
															buyerPojo.getBuyerMobile(),
															buyerPojo.getBuyerDate());
		buyerDao.save(buyerSignupEntity);
		LOG.info("Exited addBuyer()");
		return buyerPojo;
		
	}

	

}
