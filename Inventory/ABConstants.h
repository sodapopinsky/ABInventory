//
//  ABConstants.h
//  Inventory
//
//  Created by Nick Spitale on 8/11/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//


typedef NS_ENUM(int, dailyParValues){
    sundayFull = 550,
    sundaySlider = 120,
    sundayTurkey = 70,
    mondayFull = 350,
    mondaySlider = 75,
    mondayTurkey = 50,
    tuesdayFull = 350,
    tuesdaySlider = 75,
    tuesdayTurkey = 50,
    wednesdayFull = 425,
    wednesdaySlider = 85,
    wednesdayTurkey = 50,
    thursdayFull = 450,
    thursdaySlider = 100,
    thursdayTurkey = 50,
    fridayFull = 600,
    fridaySlider = 100,
    fridayTurkey = 60,
    saturdayFull = 600,
    saturdaySlider = 140,
    saturdayTurkey = 70
};


//Parse ObjectIDs
extern NSString *const kABSliderBuns;
extern NSString *const kABFullBuns;
extern NSString *const kABSliderPatty;
extern NSString *const kABFullPatty;


//MeatLogClass
NSString *const kABMeatLogChuckWeight;
NSString *const kABMeatLogFullsMade;
NSString *const kABMeatLogSlidersMade;
NSString *const kABMeatLogTurkeysMade;

