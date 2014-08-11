//
//  ABEODViewController.h
//  Inventory
//
//  Created by Nick Spitale on 8/10/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABEODViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fldBuns;
@property (weak, nonatomic) IBOutlet UITextField *fldFulls;
@property (weak, nonatomic) IBOutlet UITextField *fldSliderBuns;
@property (weak, nonatomic) IBOutlet UITextField *fldSliders;

@property (weak, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)save:(id)sender;

@end
