//
//  CartViewController.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartCell.h"
#import "DBParseSave.h"

@interface CartViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, CartDelegate>

@property (weak, nonatomic) IBOutlet UITableView *cartTable;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;

@end
