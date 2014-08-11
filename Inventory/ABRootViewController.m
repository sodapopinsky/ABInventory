//
//  ABRootViewController.m
//  Inventory
//
//  Created by Nick Spitale on 8/10/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import "ABRootViewController.h"
#import "ABEODViewController.h"

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
    
    UIButton *goEOD = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [goEOD setTitle:@"End of Day Inventory" forState:UIControlStateNormal];
    [goEOD setFrame:CGRectMake(50, 100, 150, 50)];
   
    [goEOD addTarget:self action:@selector(goEOD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goEOD];
    
    // Do any additional setup after loading the view.
}
-(void)goEOD{
    ABEODViewController *eodVC = [[ABEODViewController alloc] initWithNibName:@"ABEODViewController" bundle:nil];
    [self.navigationController pushViewController:eodVC animated:YES];
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
