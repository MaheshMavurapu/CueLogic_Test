//
//  ProductCell.h
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductDelegate <NSObject>

-(void)addRespectiveItemToCart:(NSString*)prodName withItem:(int)item;

@end


@interface ProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UILabel *prodName;
@property (weak, nonatomic) IBOutlet UILabel *prodPrice;
@property (weak, nonatomic) IBOutlet UILabel *vendName;
@property (weak, nonatomic) IBOutlet UILabel *vendPrice;

@property (weak, nonatomic) IBOutlet UIButton *addCart;

@property (weak, nonatomic) id<ProductDelegate> proDelegate;
@property (nonatomic) int indexNumber;
@property (strong, nonatomic) NSString *prodNAME;


@end
