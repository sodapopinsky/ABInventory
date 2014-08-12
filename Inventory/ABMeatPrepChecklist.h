//
//  ABMeatPrepChecklist.h
//  Inventory
//
//  Created by Nick Spitale on 8/11/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCache.h"


@interface ABMeatPrepChecklist : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@property (weak, nonatomic) IBOutlet UITextField *txtFullCount;
@property (weak, nonatomic) IBOutlet UITextField *txtSliderCount;
@property (weak, nonatomic) IBOutlet UITextField *txtTurkeyCount;
@property (weak, nonatomic) IBOutlet UILabel *lblParValues;
@property (weak, nonatomic) IBOutlet UILabel *lblTurkeyPar;

- (IBAction)calculatePar:(id)sender;

@end
