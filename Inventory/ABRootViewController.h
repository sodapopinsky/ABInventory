//
//  ABRootViewController.h
//  Inventory
//
//  Created by Nick Spitale on 8/10/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABRootViewController : UIViewController
- (IBAction)goEndOfDay:(id)sender;
- (IBAction)goMeatPrep:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentDate;
@property (weak, nonatomic) IBOutlet UIImageView *checkMarkEOD;
@property (weak, nonatomic) IBOutlet UIImageView *checkMarkMeatPrep;

@end
