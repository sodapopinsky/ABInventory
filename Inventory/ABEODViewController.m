//
//  ABEODViewController.m
//  Inventory
//
//  Created by Nick Spitale on 8/10/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import "ABEODViewController.h"
#import <Parse/Parse.h>
@interface ABEODViewController ()

@end

@implementation ABEODViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender{
    
    PFObject *bunsFull = [PFObject objectWithoutDataWithClassName:@"items"
                                                       objectId:@"g3c7M4EbY3"];
    PFObject *saveEntries = [PFObject objectWithClassName:@"entries"];
    [saveEntries setObject:bunsFull forKey:@"item"];
    NSNumber *c = [NSNumber numberWithInt:5];
    [saveEntries setObject:c forKey:@"count"];
    [saveEntries saveEventually];
}

@end
