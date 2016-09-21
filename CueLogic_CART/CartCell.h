//
//  CartCell.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CartDelegate <NSObject>

-(void)removeRespectiveItem:(NSString*)prodName;
-(void)callToTheRespectiveNumber:(NSString*)prodName;

@end


@interface CartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UILabel *prodName;
@property (weak, nonatomic) IBOutlet UILabel *prodPrice;
@property (weak, nonatomic) IBOutlet UILabel *vendName;
@property (weak, nonatomic) IBOutlet UILabel *vendPrice;

@property (weak, nonatomic) IBOutlet UIButton *deleteCart;
@property (weak, nonatomic) IBOutlet UIButton *callPhone;

@property (weak, nonatomic) id<CartDelegate> cartDelegate;
@property (strong, nonatomic) NSString *prodNAME;


@end
