import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { EmartService } from '../emart.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationGuard implements CanActivate {
  constructor(protected emartService: EmartService,protected router: Router){}
  
  canActivate(route:ActivatedRouteSnapshot,state:RouterStateSnapshot):boolean
    {
      const userExist = !!this.emartService.getCurrentBuyer();
      if(userExist){
        return true;
      }
      else{
        this.router.navigate(['/']);
        return false;
      }
    }
}
    
