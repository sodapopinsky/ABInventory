//
//  ABRootViewController.m
//  Inventory
//
//  Created by Nick Spitale on 8/10/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import "ABRootViewController.h"
#import "ABEODViewController.h"
#import "ABMeatPrepChecklist.h"
@interface ABRootViewController ()

@end

@implementation ABRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Atomic Burger"];
    
    UIImageView *inventoryImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"inventoryIcon"]];
    inventoryImage.contentMode = UIViewContentModeScaleAspectFit;
    [inventoryImage setFrame:CGRectMake(30, 100, 50, 50)];
    [self.view addSubview:inventoryImage];
    
    UIButton *goEOD = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [goEOD setTitle:@"End of Day Inventory" forState:UIControlStateNormal];
    [goEOD.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
    [goEOD setFrame:CGRectMake(70, 105, 300, 50)];
   
    [goEOD addTarget:self action:@selector(goEOD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goEOD];
    
    
    UIButton *goMeatPrep = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [goMeatPrep setTitle:@"Meat Prep Checklist" forState:UIControlStateNormal];
    [goMeatPrep.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
    [goMeatPrep setFrame:CGRectMake(70, 155, 300, 50)];
    
    [goMeatPrep addTarget:self action:@selector(goMeatPrep) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goMeatPrep];
    // Do any additional setup after loading the view.
}
-(void)goEOD{
    ABEODViewController *eodVC = [[ABEODViewController alloc] initWithNibName:@"ABEODViewController" bundle:nil];
    [self.navigationController pushViewController:eodVC animated:YES];
}
-(void)goMeatPrep{
    ABMeatPrepChecklist *mpcl = [[ABMeatPrepChecklist alloc] initWithNibName:@"ABMeatPrepChecklist" bundle:nil];
    [self.navigationController pushViewController:mpcl animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
