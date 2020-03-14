package com.abc.BuyerItemservice.service;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.BuyerItemservice.controller.BillController;
import com.abc.BuyerItemservice.dao.BillDao;
import com.abc.BuyerItemservice.dao.BillDetailsDao;
import com.abc.BuyerItemservice.dao.entity.BillDetailsEntity;
import com.abc.BuyerItemservice.dao.entity.BillEntity;
import com.abc.BuyerItemservice.dao.entity.BuyerSignupEntity;
import com.abc.BuyerItemservice.dao.entity.CategoryEntity;
import com.abc.BuyerItemservice.dao.entity.ItemEntity;
import com.abc.BuyerItemservice.dao.entity.SellerSignupEntity;
import com.abc.BuyerItemservice.dao.entity.SubCategoryEntity;
import com.abc.BuyerItemservice.model.BillDetailsPojo;
import com.abc.BuyerItemservice.model.BillPojo;
import com.abc.BuyerItemservice.model.BuyerSignupPojo;
import com.abc.BuyerItemservice.model.CategoryPojo;
import com.abc.BuyerItemservice.model.ItemPojo;
import com.abc.BuyerItemservice.model.SellerSignupPojo;
import com.abc.BuyerItemservice.model.SubCategoryPojo;
@Service
public class BillServiceImpl implements BillService {
	
	static Logger Log = Logger.getLogger(BillController.class.getClass());
	
	
	/*@Autowired annotation injects object dependency implicitly*/
	@Autowired
	BillDao billDao;
	
	@Autowired
	BillDetailsDao billDetailsDao;
	
	@Override
	@Transactional
	/*saveBill() stores pojo into entity and returns billPojo */
	public BillPojo saveBill(BillPojo billPojo) {
		
		Log.info("entered saveBill()");
		
		BuyerSignupPojo buyerPojo=billPojo.getBuyer();
		BuyerSignupEntity buyerEntity = new BuyerSignupEntity(buyerPojo.getBuyerId(),
																buyerPojo.getBuyerUsername(),
																buyerPojo.getBuyerPassword(),
																buyerPojo.getBuyerEmail(),
																buyerPojo.getBuyerMobile(),
																buyerPojo.getBuyerDate(),
																null);
		
		BillEntity billEntity = new BillEntity();
		billEntity.setBillId(0);
		billEntity.setBillAmount(billPojo.getBillAmount());
		billEntity.setBillRemarks(billPojo.getBillRemarks());
		billEntity.setBillType(billPojo.getBillType());
		billEntity.setBillDate(billPojo.getBillDate());
		billEntity.setBuyerSignup(buyerEntity);
		
		billEntity = billDao.saveAndFlush(billEntity);
		billPojo.setBillId(billEntity.getBillId());
		
		BillEntity setBillEntity = billDao.findById(billEntity.getBillId()).get();
		
		Set<BillDetailsEntity> allBillDetails = new HashSet<BillDetailsEntity>();
		Set<BillDetailsPojo> allBillDetailsPojo = billPojo.getAllBillDetails();
		
		for(BillDetailsPojo  billDetailsPojo : allBillDetailsPojo) {
			ItemPojo itemPojo = billDetailsPojo.getItem();
			SubCategoryPojo subCategoryPojo = itemPojo.getSubcategory();
			SellerSignupPojo sellerPojo = itemPojo.getSellersignup();
			CategoryPojo categoryPojo = subCategoryPojo.getCategory();
			
			SellerSignupEntity sellerEntity = new SellerSignupEntity(sellerPojo.getSellerId(),
																sellerPojo.getSellerUsername(),
																sellerPojo.getSellerPassword(),
																sellerPojo.getSellerCompany(),
																sellerPojo.getSellerBrief(),
																sellerPojo.getSellerGst(),
																sellerPojo.getSellerAddress(),
																sellerPojo.getSellerEmail(),
																sellerPojo.getSellerContact(),
																sellerPojo.getSellerWebsite());
			CategoryEntity categoryEntity = new CategoryEntity(categoryPojo.getCategoryId(),
															   categoryPojo.getCategoryName(),
															   categoryPojo.getCategoryBrief());
			SubCategoryEntity subCategoryEntity = new SubCategoryEntity(subCategoryPojo.getSubCategoryId(),
																	subCategoryPojo.getSubCategoryName(),
																	categoryEntity,
																	subCategoryPojo.getSubCategoryBrief(),
																	subCategoryPojo.getSubCategoryGst());
			ItemEntity itemEntity = new ItemEntity(itemPojo.getItemId(),
					itemPojo.getItemName(),
					itemPojo.getItemImage(),
					itemPojo.getItemPrice(),
					itemPojo.getItemStock(),
					itemPojo.getItemDescription(),
					subCategoryEntity,
					itemPojo.getItemRemarks(),
					sellerEntity);
			
			BillDetailsEntity billDetailsEntity = new BillDetailsEntity(billDetailsPojo.getBillDetailsId(),
					setBillEntity,
					itemEntity);
			
			billDetailsDao.save(billDetailsEntity);
																
		}
		Log.info("exited saveBill()");
		return billPojo;
		}

	
}

