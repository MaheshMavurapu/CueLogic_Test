//
//  CartViewController.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()
{
    NSDictionary *cartList;
    NSMutableArray *listOfItems;
    
    long finalAmount;
}

@end

@implementation CartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = @"Cart";

    listOfItems = [[NSMutableArray alloc]init];
    [self dataFetchAndLoad];
}

-(void)dataFetchAndLoad
{
    cartList = [[[DBParseSave alloc]init] getListOfAddedProducts];
    
    for(NSString *str in cartList)
    {
        SingleProduct *prod = [cartList objectForKey:str];
        [listOfItems addObject:prod];
        
        finalAmount = finalAmount + prod.pricename.doubleValue;
    }
    
    [self.cartTable reloadData];
    
    self.totalPrice.text = [NSString stringWithFormat:@"Total Price: %ld", finalAmount];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 139;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listOfItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cartCell = [tableView dequeueReusableCellWithIdentifier:@"CartID"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
    {
        SingleProduct *product = [listOfItems objectAtIndex:(int)indexPath.row];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:product.productImg]];
                       
        dispatch_async(dispatch_get_main_queue(), ^
        {
            cartCell.productImage.image = [UIImage imageWithData:imageData];
            cartCell.prodName.text = product.productname;
            cartCell.prodPrice.text = [NSString stringWithFormat:@"Price: %@", product.pricename];;
            cartCell.vendName.text = product.vendorname;
            cartCell.vendPrice.text = product.vendoraddress;
            
            cartCell.prodNAME = product.productname;
            
            cartCell.cartDelegate = self;
        });
    });
    
    return cartCell;
}

-(void)removeRespectiveItem:(NSString*)prodName
{
    finalAmount = 0;
    [listOfItems removeAllObjects];
    [[[DBParseSave alloc]init] deleteCartWithTheProductName:prodName];
    [self dataFetchAndLoad];
}

-(void)callToTheRespectiveNumber:(NSString*)prodName
{
    SingleProduct *product = [[CartList getInstance].cartItems objectForKey:prodName];
    NSString *phoneStr = product.phoneNumber;
    
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phoneStr]];
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl])
    {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    }
    else
    {
        [[[UIAlertView alloc]initWithTitle:@"ALERT" message:@"Call facility is not available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
