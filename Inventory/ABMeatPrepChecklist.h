    //
//  ABMeatPrepChecklist.h
//  Inventory
//
//  Created by Nick Spitale on 8/11/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCache.h"


@interface ABMeatPrepChecklist : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) NSDate *instanceDate;
@property BOOL isSaved;
@property (weak, nonatomic) IBOutlet UILabel *lblIsSaved;

@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblFullPar;
@property (weak, nonatomic) IBOutlet UILabel *lblSliderPar;
@property (weak, nonatomic) IBOutlet UILabel *lblTurkeyPar;

@property (weak, nonatomic) IBOutlet UITextField *txtFullCount;
@property (weak, nonatomic) IBOutlet UITextField *txtSliderCount;
@property (weak, nonatomic) IBOutlet UITextField *txtTurkeyCount;
@property (weak, nonatomic) IBOutlet UILabel *lblBeefNeeded;
@property (weak, nonatomic) IBOutlet UILabel *lblTurkeyNeeded;

@property (weak, nonatomic) IBOutlet UILabel *lblChuckWeight;
@property (weak, nonatomic) IBOutlet UITextField *txtChuckWeightCut;
@property (weak, nonatomic) IBOutlet UITextField *txtFullMade;
@property (weak, nonatomic) IBOutlet UITextField *txtSliderMade;
@property (weak, nonatomic) IBOutlet UITextField *txtTurkeyMade;
@property (weak, nonatomic) IBOutlet UITextField *txtEmployeeSignature;

@property (weak, nonatomic) IBOutlet UILabel *lblFullNeeded;

@property (weak, nonatomic) IBOutlet UILabel *lblSliderNeeded;

@property (weak, nonatomic) IBOutlet UILabel *errAllFields;
- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *viewSaved;

- (IBAction)calculatePar:(id)sender;

@end
