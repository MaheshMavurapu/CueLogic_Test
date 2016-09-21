//
//  Products.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "Products.h"
#import "SingleProductS.h"

@implementation Products

-(id)initWithProducts:(NSDictionary*)json
{
    self=[super init];
    
    if(self)
    {
        self.products = [[NSMutableArray alloc]init];
        NSArray *products = [json objectForKey:@"products"];
        
        for(NSDictionary *product in products)
        {
            SingleProductS *singleProduct = [[SingleProductS alloc]init];
            singleProduct = [singleProduct initWithProduct:product];
            [self.products addObject:singleProduct];
        }
    }
    
    return self;
}

@end
