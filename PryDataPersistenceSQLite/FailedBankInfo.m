//
//  FailedBankInfo.m
//  PryDataPersistenceSQLite
//
//  Created by Henry AT on 5/9/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import "FailedBankInfo.h"

@implementation FailedBankInfo

@synthesize uniqueId = _uniqueId;
@synthesize name = _name;
@synthesize city = _city;
@synthesize state = _state;

- (id)initWithUniqueId:(int)uniqueId name:(NSString *)name city:(NSString *)city
                 state:(NSString *)state {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.name = name;
        self.city = city;
        self.state = state;
    }
    return self;
}


@end
