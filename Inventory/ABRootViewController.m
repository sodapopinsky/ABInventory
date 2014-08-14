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
@property (nonatomic, strong) ABMeatPrepChecklist *meatPrepChecklist;
@property (nonatomic, strong) ABEODViewController *EODInventory;
@end

@implementation ABRootViewController
@synthesize meatPrepChecklist, lblCurrentDate, EODInventory;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        meatPrepChecklist = [[ABMeatPrepChecklist alloc]  initWithNibName:@"ABMeatPrepChecklist" bundle:nil];
        EODInventory = [[ABEODViewController alloc]  initWithNibName:@"ABEODViewController" bundle:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Atomic Burger"];
    

}
-(void)viewWillAppear:(BOOL)animated{
    NSDateFormatter *formatted = [[NSDateFormatter alloc] init];
    [formatted setDateFormat:@"MM/dd/yyyy"];
    NSDate *today = [NSDate date];
    NSString *dateString = [formatted stringFromDate:today];
    [lblCurrentDate setText:dateString];
    
    [self.checkMarkMeatPrep setImage:[UIImage imageNamed:@"checkMarkGray"]];
    if(meatPrepChecklist.isSaved){
        NSComparisonResult comp = [self compareDateOnly:meatPrepChecklist.instanceDate];
        if(comp == NSOrderedSame){
            [self.checkMarkMeatPrep setImage:[UIImage imageNamed:@"checkMark"]];
        }
    }
    
    [self.checkMarkEOD setImage:[UIImage imageNamed:@"checkMarkGray"]];
    if(EODInventory.isSaved){
        NSComparisonResult comp = [self compareDateOnly:EODInventory.instanceDate];
        if(comp == NSOrderedSame){
            [self.checkMarkEOD setImage:[UIImage imageNamed:@"checkMark"]];
        }
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSComparisonResult)compareDateOnly:(NSDate *)otherDate {
    NSUInteger dateFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *selfComponents = [gregorianCalendar components:dateFlags fromDate:[NSDate date]];
    NSDate *selfDateOnly = [gregorianCalendar dateFromComponents:selfComponents];
    
    NSDateComponents *otherCompents = [gregorianCalendar components:dateFlags fromDate:otherDate];
    NSDate *otherDateOnly = [gregorianCalendar dateFromComponents:otherCompents];

    return [selfDateOnly compare:otherDateOnly];
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

- (IBAction)goEndOfDay:(id)sender {
    
    NSComparisonResult comp = [self compareDateOnly:EODInventory.instanceDate];
    
    if(comp == NSOrderedSame){
        [self.navigationController pushViewController:EODInventory animated:YES];
        
        
        return;
    }
    
   EODInventory = nil;
   EODInventory = [[ABEODViewController alloc] initWithNibName:@"ABEODViewController" bundle:nil];
    [self.navigationController pushViewController:EODInventory animated:YES];
    
    

}

- (IBAction)goMeatPrep:(id)sender {
    
    NSComparisonResult comp = [self compareDateOnly:meatPrepChecklist.instanceDate];
    
    if(comp == NSOrderedSame){
        [self.navigationController pushViewController:meatPrepChecklist animated:YES];
        return;
    }
    
    meatPrepChecklist = nil;
    meatPrepChecklist = [[ABMeatPrepChecklist alloc] initWithNibName:@"ABMeatPrepChecklist" bundle:nil];
    [self.navigationController pushViewController:meatPrepChecklist animated:YES];
}


@end
