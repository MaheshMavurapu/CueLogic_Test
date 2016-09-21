//
//  ProductsViewController.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "ProductsViewController.h"
#import "ParseData.h"
#import "Products.h"

@interface ProductsViewController ()
{
    NSArray *productsList;
}

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requstDataFromServer];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = @"Shop";
    
    [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"123.jpg"]]; // Can take anything.
    [[self.tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"123.jpg"]];
}

-(void)dataFetchAndLoad
{
    productsList = [[[DBParseSave alloc]init] getCurrentProductLists];
    
    self.productTable.dataSource = self;
    self.productTable.delegate = self;
    [self.productTable reloadData];
}

-(void)requstDataFromServer
{
    BOOL isDataSaved = [[NSUserDefaults standardUserDefaults]boolForKey:@"DataSave"];
    
    if(isDataSaved == YES) // Fetch from DB
    {
        [self dataFetchAndLoad];
    }
    else // Fetch from server and parse and save it.
    {
        [[ProcessViewLoader getInstance]showLoadingViewMessage:@"Loading..."];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setTimeoutInterval:60];
        
        [request setURL:[NSURL URLWithString:@"https://mobiletest-hackathon.herokuapp.com/getdata/"]];
        [request setHTTPMethod:@"GET"];
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[[NSOperationQueue alloc] init]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
         {
             [[ProcessViewLoader getInstance]removeLoadingView];
             
             if (!error)
             {
                 NSError *error1;
                 NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
                 
                 [ParseData parseJsonResponse:json];
                 
                 [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"DataSave"];
                 
                 [self dataFetchAndLoad];
             }
             else
             {
                 [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"DataSave"];
             }
         }];
    }
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
    return productsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *prodCell = [tableView dequeueReusableCellWithIdentifier:@"ProductID"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
    {
        SingleProduct *product = [productsList objectAtIndex:indexPath.row];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:product.productImg]];
        
        dispatch_async(dispatch_get_main_queue(), ^
        {
            prodCell.productImage.image = [UIImage imageWithData:imageData];
            
            prodCell.prodName.text = product.productname;
            prodCell.prodPrice.text = [NSString stringWithFormat:@"Price: %@", product.pricename];
            prodCell.vendName.text = product.vendorname;
            prodCell.vendPrice.text = product.vendoraddress;
            
            prodCell.prodNAME = product.productname;
            prodCell.indexNumber = (int)indexPath.row;
            
            prodCell.proDelegate = self;
        });
    });
    
    return prodCell;
}

-(void)addRespectiveItemToCart:(NSString*)prodName withItem:(int)item
{
    SingleProduct *product = [[CartList getInstance].cartItems  objectForKey:prodName];
    
    if(product != nil)
    {
        [[[UIAlertView alloc]initWithTitle:@"ALERT" message:@"Product is already added" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]show];
    }
    else
    {
        [[[DBParseSave alloc]init] saveToCartWithProduct:[productsList objectAtIndex:item] withProdName:prodName];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
