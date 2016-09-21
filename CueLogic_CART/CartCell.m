//
//  CartCell.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "CartCell.h"

@implementation CartCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)removeFromCartClicked:(id)sender
{
    [self.cartDelegate removeRespectiveItem:self.prodNAME];
}

-(IBAction)phoneCallClicked:(id)sender
{
    [self.cartDelegate callToTheRespectiveNumber:self.prodNAME];
}

@end
