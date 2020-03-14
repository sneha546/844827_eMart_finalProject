package com.abc.BuyerItemservice.service;


import java.util.List;

import com.abc.BuyerItemservice.model.ItemPojo;


public interface ItemService {
	
	List<ItemPojo> getAllItems();
	ItemPojo getItem(Integer itemId);
	void deleteItems(Integer itemId);
	ItemPojo addItems(ItemPojo itemPojo);
	

}
