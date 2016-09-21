//
//  ProcessViewLoader.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 21/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProcessViewLoader : NSObject

+(ProcessViewLoader*)getInstance;
-(void)showLoadingViewMessage:(NSString*)message;
-(void)removeLoadingView;

@property (strong, nonatomic) UIAlertView *alertView;

@end
