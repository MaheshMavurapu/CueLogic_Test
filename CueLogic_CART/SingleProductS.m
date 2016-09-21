//
//  SingleProduct.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "SingleProductS.h"

@implementation SingleProductS

-(id)initWithProduct:(NSDictionary*)product
{
    self=[super init];
    
    if(self)
    {
        self.productname = [product objectForKey:@"productname"];
        self.pricename = [product objectForKey:@"price"];
        self.vendorname = [product objectForKey:@"vendorname"];
        self.vendoraddress = [product objectForKey:@"vendoraddress"];
        self.productImg = [product objectForKey:@"productImg"];
        self.productGallery = [product objectForKey:@"productGallery"];
        self.phoneNumber = [product objectForKey:@"phoneNumber"];
    }
    
    return self;
}

@end
