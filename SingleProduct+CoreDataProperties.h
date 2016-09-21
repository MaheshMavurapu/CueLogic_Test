//
//  SingleProduct+CoreDataProperties.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 21/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SingleProduct.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleProduct (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *pricename;
@property (nullable, nonatomic, retain) NSString *productImg;
@property (nullable, nonatomic, retain) NSString *productname;
@property (nullable, nonatomic, retain) NSString *vendoraddress;
@property (nullable, nonatomic, retain) NSString *vendorname;
@property (nullable, nonatomic, retain) id productGallery;

@end

NS_ASSUME_NONNULL_END
