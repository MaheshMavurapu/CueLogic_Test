//
//  CartList.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 21/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartList : NSObject

+(CartList*)getInstance;

@property (strong, nonatomic) NSMutableDictionary *cartItems; // Contains current list added to Cart.

@end
