//
//  FieldEntity.h
//  PryDataPersistenceSQLite
//
//  Created by Henry AT on 5/9/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FieldEntity : NSObject {
    int _uniqueId;
    NSString *_name;

}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;


- (id)initWithUniqueId:(int)uniqueId nameFieldData:(NSString *)name;

@end
