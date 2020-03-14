import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ItemListComponent } from './emart/items/item-list/item-list.component';
import { ItemDisplayComponent } from './emart/items/item-display/item-display.component';
import { CartListComponent } from './emart/cart/cart-list/cart-list.component';
import { BillViewComponent } from './emart/bill/bill-view/bill-view.component';
import { BillListComponent } from './emart/bill/bill-list/bill-list.component';
import { LoginComponent } from './emart/user/login/login.component';
import { LogoutComponent } from './emart/logout/logout.component';
import { SellerSignupComponent } from './emart/user/seller-signup/seller-signup.component';

import { AuthenticationGuard } from './emart/authentication.guard';
import { BuyerSignupComponent } from './emart/user/buyer-signup/buyer-signup.component';

const routes: Routes = [{
                          path: 'login',
                          component: LoginComponent
                        },
                        {
                          path: 'seller-signup',
                          component: SellerSignupComponent,
                         
                        },
                        {
                          path: 'buyer-signup',
                          component: BuyerSignupComponent
                          
                        },
                        {
                          path: 'item-list',
                          component: ItemListComponent,
                          canActivate : [AuthenticationGuard]
                        },
                        {
                          path: 'item-display/:iId',
                          component: ItemDisplayComponent,
                          canActivate : [AuthenticationGuard]
                        },
                        {
                          path: 'cart-list',
                          component: CartListComponent,
                          canActivate : [AuthenticationGuard]
                        },
                        {
                          path: 'bill-view',
                          component: BillViewComponent,
                          canActivate : [AuthenticationGuard]
                        },
                        {
                          path: 'bill-list',
                          component: BillListComponent,
                          canActivate : [AuthenticationGuard]
                        },
                        {
                          path: 'logout',
                          component: LogoutComponent
                        }
                        ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
