//
//  ABEODViewController.m
//  Inventory
//
//  Created by Nick Spitale on 8/10/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import "ABEODViewController.h"
#import <Parse/Parse.h>
#import "ABConstants.h"
#import "MBProgressHUD.h"

@interface ABEODViewController ()
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation ABEODViewController

@synthesize lblInstanceDate, fldBuns, fldSliderBuns, fldSliders, fldFulls, isSaved, instanceDate, hud, txtEmployee, lblErrFields, viewSaved;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isSaved = NO;
        instanceDate = [NSDate date];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 self.title = @"EOD Inventory";
    [fldBuns becomeFirstResponder];
    
    fldBuns.delegate = self;
    fldSliderBuns.delegate = self;
       fldSliders.delegate = self;
       fldFulls.delegate = self;
    
    [fldBuns setKeyboardType:UIKeyboardTypeNumberPad];
    [fldSliderBuns setKeyboardType:UIKeyboardTypeNumberPad];
    [fldSliders setKeyboardType:UIKeyboardTypeNumberPad];
    [fldFulls setKeyboardType:UIKeyboardTypeNumberPad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender{
  
    
    if([fldBuns.text length] <= 0 || [fldSliderBuns.text length] <= 0 || [fldSliders.text length] <= 0 || [fldFulls.text length] <= 0 || [txtEmployee.text length] <= 0 ){
        lblErrFields.hidden = NO;
        return;
    }
    
    NSMutableDictionary *itemsDictionary = [[NSMutableDictionary alloc] init];
    

    [itemsDictionary setObject:[NSNumber numberWithInt:[fldSliderBuns.text intValue]] forKey:kABSliderBuns];
    
    [itemsDictionary setObject:[NSNumber numberWithInt:[fldSliders.text intValue]] forKey:kABSliderPatty];
    
    [itemsDictionary setObject:[NSNumber numberWithInt:[fldBuns.text intValue]] forKey:kABFullBuns];
    
    [itemsDictionary setObject:[NSNumber numberWithInt:[fldFulls.text intValue]] forKey:kABFullPatty];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.labelText = NSLocalizedString(@"Saving", nil);
    self.hud.dimBackground = NO;
 
   for (NSString* key in itemsDictionary) {
       PFObject *saveEntries = [PFObject objectWithClassName:@"entries"];
       [saveEntries setObject:[PFObject objectWithoutDataWithClassName:@"items"
                                                              objectId:key] forKey:@"item"];
        [saveEntries setObject:[itemsDictionary objectForKey:key] forKey:@"count"];

       [saveEntries saveEventually];

   
       
    }
    viewSaved.hidden = NO;
    isSaved = YES;
    [self.hud hide:YES];
   [self.navigationController popToRootViewControllerAnimated:YES];
 
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // Check for non-numeric characters
    NSUInteger lengthOfString = string.length;
    for (NSInteger index = 0; index < lengthOfString; index++) {
        unichar character = [string characterAtIndex:index];
        if (character < 48) return NO; // 48 unichar for 0
        if (character > 57) return NO; // 57 unichar for 9
    }
    // Check for total length
    NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
    if (proposedNewLength > 6)
        return YES;
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    lblErrFields.hidden = YES;
    

        NSDateFormatter *formatted = [[NSDateFormatter alloc] init];
        [formatted setDateFormat:@"MM/dd/yyyy"];
        NSDate *today = [NSDate date];
        NSString *dateString = [formatted stringFromDate:today];
        
        [lblInstanceDate setText:dateString];
    
    
}

@end
