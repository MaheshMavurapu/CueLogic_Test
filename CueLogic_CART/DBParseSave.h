//
//  DBParseSave.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Products.h"
#import "DBManager.h"
#import "Product.h"
#import "SingleProduct.h"
#import "SingleProductS.h"
#import "CartList.h"

@interface DBParseSave : NSObject
{
    DBManager *dbManager;
}

-(void)parseJsonObject:(Products*)products;
-(Product*)getProducts;

-(NSDictionary*)getListOfAddedProducts;
-(void)deleteCartWithTheProductName:(NSString*)prodName;
-(void)saveToCartWithProduct:(SingleProduct*)product withProdName:(NSString*)name;

-(NSArray*)getCurrentProductLists;

@end
