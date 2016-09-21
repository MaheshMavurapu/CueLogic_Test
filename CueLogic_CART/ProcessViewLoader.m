//
//  ProcessViewLoader.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 21/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "ProcessViewLoader.h"

@implementation ProcessViewLoader

static dispatch_once_t pred;
static ProcessViewLoader *sharedInstance = nil;

+(ProcessViewLoader*)getInstance
{
    dispatch_once(&pred, ^
    {
        if(sharedInstance == nil)
        {
            sharedInstance = [[ProcessViewLoader alloc]init];
        }
    });
    
    return sharedInstance;
}

-(void)showLoadingViewMessage:(NSString*)message
{
    if (self.alertView == nil)
    {
        self.alertView = [[UIAlertView alloc] initWithTitle:message message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        
        UIActivityIndicatorView *ActInd = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [ActInd startAnimating];
        [ActInd setFrame:CGRectMake(125, 60, 37, 37)];
        
        [self.alertView addSubview:ActInd];
        [self.alertView show];
    }
}

-(void)removeLoadingView
{
    [self.alertView dismissWithClickedButtonIndex:0 animated:YES];
    self.alertView = nil;
}


@end
