//
//  CartList.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 21/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "CartList.h"

@implementation CartList

static dispatch_once_t pred;
static CartList *sharedInstance = nil;

-(id)init // Initialisation
{
    self = [super init];
    
    if(self)
    {
        self.cartItems = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

+(CartList*)getInstance // Making singleton to save the latest update as the current Obj.
{
    dispatch_once(&pred, ^
    {
        if(sharedInstance == nil)
        {
            sharedInstance = [[CartList alloc]init];
        }
    });
    
    return sharedInstance;
}



@end
