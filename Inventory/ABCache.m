//
//  ABCache.m
//  Inventory
//
//  Created by Nick Spitale on 8/11/14.
//  Copyright (c) 2014 Atomic Burger. All rights reserved.
//

#import "ABCache.h"

@interface ABCache()
@property (nonatomic, strong) NSCache *cache;
@end

@implementation ABCache
@synthesize cache;

#pragma mark - Initialization

+ (id)sharedCache {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    return self;
}


@end
