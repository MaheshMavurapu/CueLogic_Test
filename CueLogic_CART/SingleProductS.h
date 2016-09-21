//
//  SingleProduct.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleProductS : NSObject

@property (strong, nonatomic) NSString *productname;
@property (strong, nonatomic) NSString *pricename;
@property (strong, nonatomic) NSString *vendorname;
@property (strong, nonatomic) NSString *vendoraddress;
@property (strong, nonatomic) NSString *productImg;
@property (strong, nonatomic) NSMutableArray *productGallery;
@property (strong, nonatomic) NSString *phoneNumber;

-(id)initWithProduct:(NSDictionary*)product;

@end
