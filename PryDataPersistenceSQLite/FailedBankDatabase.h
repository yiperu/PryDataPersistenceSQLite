//
//  FailedBankDatabase.h
//  PryDataPersistenceSQLite
//
//  Created by Henry AT on 5/9/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface FailedBankDatabase : NSObject {
    sqlite3 *_database;
}

+ (FailedBankDatabase*)database;


- (NSArray *)failedBankInfos;
- (NSArray *)retornaInfoFields;

@end
