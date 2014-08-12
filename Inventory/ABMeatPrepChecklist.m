//
//  ABMeatPrepChecklist.m
//  Inventory
//
//  Created by Nick Spitale on 8/11/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import "ABMeatPrepChecklist.h"


@interface ABMeatPrepChecklist ()
@property (nonatomic,strong) NSNumber *fullPar;
@property (nonatomic,strong) NSNumber *sliderPar;
@property (nonatomic,strong) NSNumber *turkeyPar;
@end

@implementation ABMeatPrepChecklist
@synthesize lblDate, txtFullCount, txtSliderCount,txtTurkeyCount, lblBeefNeeded, lblTurkeyNeeded, fullPar, sliderPar, turkeyPar, lblTurkeyPar, lblSliderPar, lblFullPar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSMutableDictionary *values = [self getTodaysParValues];
        
        
        fullPar = [values objectForKey:@"Full"];
        sliderPar = [values objectForKey:@"Slider"];
        turkeyPar = [values objectForKey:@"Turkey"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDateFormatter *formatted = [[NSDateFormatter alloc] init];
    [formatted setDateFormat:@"MM/dd/yyyy"];
    NSDate *today = [NSDate date];
    NSString *dateString = [formatted stringFromDate:today];
    
    [lblDate setText:dateString];
    [lblFullPar setText:[NSString stringWithFormat:@"%@",fullPar]];
    [lblSliderPar setText:[NSString stringWithFormat:@"%@",sliderPar]];
    [lblTurkeyPar setText:[NSString stringWithFormat:@"%@",turkeyPar]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculatePar:(id)sender {
    if(txtFullCount.text.length == 0 || txtSliderCount.text.length == 0 || txtTurkeyCount.text.length == 0){
        [lblBeefNeeded setText:@"All counts must be filled out"];
        return;
    }
    

    //Ounces
    double currentWeight = [txtFullCount.text doubleValue] * 5 + [txtSliderCount.text doubleValue] * 1.75;
    double parWeight = [fullPar doubleValue] * 5 + [sliderPar doubleValue] * 1.75;
    
    double weightNeeded = parWeight - currentWeight;
    double lbsNeeded = weightNeeded  / 16;
    int fullNeeded = [fullPar intValue] - [txtFullCount.text intValue];
    int sliderNeeded = [sliderPar intValue] - [txtSliderCount.text intValue];
    int turkeyNeeded = [turkeyPar intValue] - [txtTurkeyCount.text intValue];
    double chucksNeeded = (lbsNeeded * 1.03) / 24; //for 3% waste
    [lblBeefNeeded setText:[NSString stringWithFormat:@"Fulls:%i, Sliders:%i, Chucks: %f",fullNeeded, sliderNeeded, chucksNeeded]];
    [lblTurkeyNeeded setText:[NSString stringWithFormat:@"Turkeys: %i", turkeyNeeded]];
    
}
-(NSMutableDictionary*)getTodaysParValues{

    NSMutableDictionary *values = [[NSMutableDictionary alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = [comps weekday];
    

    switch(weekday){
        case 0:
            [values setObject:[NSNumber numberWithInt:sundayFull]  forKey:@"Full"];
            [values setObject:[NSNumber numberWithInt:sundaySlider]  forKey:@"Slider"];
            [values setObject:[NSNumber numberWithInt:sundayTurkey]  forKey:@"Turkey"];
            break;
        case 1:
            [values setObject:[NSNumber numberWithInt:mondayFull] forKey:@"Full"];
             [values setObject:[NSNumber numberWithInt:mondaySlider] forKey:@"Slider"];
             [values setObject:[NSNumber numberWithInt:mondayTurkey] forKey:@"Turkey"];
            break;
        case 2:
            [values setObject:[NSNumber numberWithInt:tuesdayFull] forKey:@"Full"];
            [values setObject:[NSNumber numberWithInt:tuesdaySlider] forKey:@"Slider"];
            [values setObject:[NSNumber numberWithInt:tuesdayTurkey] forKey:@"Turkey"];
            break;
        case 3:
            [values setObject:[NSNumber numberWithInt:wednesdayFull] forKey:@"Full"];
            [values setObject:[NSNumber numberWithInt:wednesdaySlider] forKey:@"Slider"];
            [values setObject:[NSNumber numberWithInt:wednesdayTurkey] forKey:@"Turkey"];
            break;
        case 4:
            [values setObject:[NSNumber numberWithInt:thursdayFull] forKey:@"Full"];
            [values setObject:[NSNumber numberWithInt:thursdaySlider] forKey:@"Slider"];
            [values setObject:[NSNumber numberWithInt:thursdayTurkey] forKey:@"Turkey"];
            break;
        case 5:
            [values setObject:[NSNumber numberWithInt:fridayFull] forKey:@"Full"];
            [values setObject:[NSNumber numberWithInt:fridaySlider] forKey:@"Slider"];
            [values setObject:[NSNumber numberWithInt:fridayTurkey] forKey:@"Turkey"];
            break;
        case 6:
            [values setObject:[NSNumber numberWithInt:saturdayFull] forKey:@"Full"];
            [values setObject:[NSNumber numberWithInt:saturdaySlider] forKey:@"Slider"];
            [values setObject:[NSNumber numberWithInt:saturdayTurkey] forKey:@"Turkey"];
            break;
        default:
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Error retrieving pars" userInfo:nil];
            break;
    }
    

    return values;
}
@end
