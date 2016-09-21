//
//  Product+CoreDataProperties.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 21/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<SingleProduct *> *products;

@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addProductsObject:(SingleProduct *)value;
- (void)removeProductsObject:(SingleProduct *)value;
- (void)addProducts:(NSSet<SingleProduct *> *)values;
- (void)removeProducts:(NSSet<SingleProduct *> *)values;

@end

NS_ASSUME_NONNULL_END
