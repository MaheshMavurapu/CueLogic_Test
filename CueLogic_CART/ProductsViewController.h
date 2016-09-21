//
//  ProductsViewController.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCell.h"
#import "ProcessViewLoader.h"

@interface ProductsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ProductDelegate>

@property (weak, nonatomic) IBOutlet UITableView *productTable;

@end
