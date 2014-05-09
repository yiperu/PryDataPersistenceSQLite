//
//  FieldEntity.m
//  PryDataPersistenceSQLite
//
//  Created by Henry AT on 5/9/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import "FieldEntity.h"

@implementation FieldEntity


@synthesize uniqueId = _uniqueId;
@synthesize name = _name;



- (id)initWithUniqueId:(int)uniqueId nameFieldData:(NSString *)name {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.name = name;
    }
    return self;
}


@end
