//
//  DBParseSave.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "DBParseSave.h"


@implementation DBParseSave

-(id)init
{
    dbManager = [DBManager SharedDbInstance];
    return [super init];
}

-(void)parseJsonObject:(Products*)products // Save to DB.
{
    NSManagedObjectContext *context = [dbManager managedObjectContext];
    
    Product *product = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    
    SingleProduct *singleProd;
    for (SingleProductS *singleProduct in products.products)
    {
        NSManagedObjectContext *context = [dbManager managedObjectContext];
        singleProd = [NSEntityDescription insertNewObjectForEntityForName:@"SingleProduct" inManagedObjectContext: context];
        singleProd.productname = singleProduct.productname;
        singleProd.pricename = singleProduct.pricename;
        singleProd.vendorname = singleProduct.vendorname;
        singleProd.vendoraddress = singleProduct.vendoraddress;
        singleProd.productImg = singleProduct.productImg;
        singleProd.phoneNumber = singleProduct.phoneNumber;
        singleProd.productGallery = singleProduct.productGallery;

        [product addProductsObject:singleProd];
    }
    
    [dbManager saveContext]; // Save it.
}

-(Product*)getProducts
{
    NSManagedObjectContext *moc = [dbManager managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *arr = [moc executeFetchRequest:request error:&error];
    if(arr.count>0)
        return [arr objectAtIndex:0];
    else
        return nil;
}

-(NSArray*)getCurrentProductLists
{
    NSManagedObjectContext *moc = [dbManager managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"SingleProduct" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *arr = [moc executeFetchRequest:request error:&error];
    if(arr.count>0)
        return arr;
    else
        return nil;
}

-(NSDictionary*)getListOfAddedProducts
{
    return [CartList getInstance].cartItems;
}

-(void)deleteCartWithTheProductName:(NSString*)prodName
{
    [[CartList getInstance].cartItems removeObjectForKey:prodName];
    [CartList getInstance].cartItems = [[CartList getInstance].cartItems mutableCopy];
}

-(void)saveToCartWithProduct:(SingleProduct*)product withProdName:(NSString*)name
{
    [[CartList getInstance].cartItems setObject:product forKey:name];
    [CartList getInstance].cartItems = [[CartList getInstance].cartItems mutableCopy];
}


@end
