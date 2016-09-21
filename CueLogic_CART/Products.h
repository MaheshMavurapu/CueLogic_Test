//
//  Products.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property (strong, nonatomic) NSMutableArray *products;

-(id)initWithProducts:(NSDictionary*)json;

@end
