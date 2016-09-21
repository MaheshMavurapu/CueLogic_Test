//
//  ParseData.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Products.h"
#import "DBParseSave.h"

@interface ParseData : NSObject

+(void)parseJsonResponse:(NSDictionary*)json;

@end
