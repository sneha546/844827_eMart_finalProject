import { Injectable } from '@angular/core';
import { Item } from './emart/Item';
import { Bill } from './emart/Bill';
import { Seller } from './emart/Seller';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class EmartService {
  currentSeller: any;
  

  allItems: Item[];
  cartItems: any;
  allBills: any;
  currentBuyer: any;
  allSellers: Seller[];

  constructor(protected http: HttpClient) {
    this.allBills = [];
    this.cartItems = [];
  }

  getAllItems() {
    return this.http.get("http://localhost:8083/BuyerItemservice/item/all");
  }

  setBuyerAndBills(currentBuyer) {
    this.currentBuyer = currentBuyer;
    this.allBills = currentBuyer.allBills;
  }

  setSellerAndBills(currentSeller) {
    this.currentSeller = currentSeller;
    this.allBills = currentSeller.allBills;
  }

  existBuyer(){
    return this.currentBuyer;
  }

  getCurrentBuyer() {
    return this.currentBuyer;
  }

  getItem(itemId: string) {
    return this.http.get("http://localhost:8083/BuyerItemservice/item/" + itemId);
  }

  addToCart(item: any) {
    this.cartItems.push(item);
  }

  getAllCart() {
    return [].concat(this.cartItems);
  }

  getAllBills() {
    return [].concat(this.allBills);
  }

  // Deleting the cart items //
  deleteCartItem(itemId: number) {
    let size = this.cartItems.length;
    for (let i = 0; i < size; i++) {
      if (this.cartItems[i].id == itemId) {
        this.cartItems.splice(i, 1);
        break;
      }
    }
  }

  //  to add Bill to the database 
  addBill(todayDate: Date, amt: number) {
    let allBillDetails: any[] = [];
    for (let i = 0; i < this.cartItems.length; i++) {
      allBillDetails.push({
        billDetailsId: 0,
        bill: null,
        item : this.cartItems[i]
      });
    }
    let bill: any = {
      billlId: 0,
      billType: 'credit',
      billDate: todayDate,
      billRemarks: 'paid',
      billAmount: amt,
      buyer: {
        buyerId: this.currentBuyer.buyerId
      },
      allBillDetails: allBillDetails
    }
    this.cartItems = [];
    allBillDetails=[];
    return this.http.post("http://localhost:8083/BuyerItemservice/emart/bill", bill);
  }

  // Getting current buyer details 
  getBuyer() {
    return this.http.get("http://localhost:8083/LoginService/emart/buyer/" + this.currentBuyer.buyerId);
  }

  // Validate Buyer 
  validateBuyer(user: string, password: string) {
    let credentials = user + ':' + password;
    let headers = new HttpHeaders();
    headers = headers.set('Authorization', credentials);
    return this.http.get("http://localhost:8083/LoginService/emart/validate", { headers });
  }
  
  // Validate Seller 
  validateSeller(user: string, password: string) {
    let credentials = user + ':' + password;
    let headers = new HttpHeaders();
    headers = headers.set('Authorization', credentials);
    return this.http.get("http://localhost:8083/SellerSignupService/emart/validate", { headers });
  }
  addSeller(seller:any){
    return this.http.post("http://localhost:8082/emart/seller", seller);
  }

  addBuyer(buyer:any){
    return this.http.post("http://localhost:8083/BuyerSignupService/emart/buyer", buyer);
  }
}