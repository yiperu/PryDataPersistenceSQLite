//
//  FailedBankDatabase.m
//  PryDataPersistenceSQLite
//
//  Created by Henry AT on 5/9/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"
#import "FieldEntity.h"

@implementation FailedBankDatabase


static FailedBankDatabase *_database;


+ (FailedBankDatabase*)database {
    if (_database == nil) {
        _database = [[FailedBankDatabase alloc] init];
    }
    return _database;
}



- (id)init {
    if ((self = [super init])) {
        
        
        //NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"banklist" ofType:@"sqlite3"];
        //--
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *sqLiteDb = [documentsDirectory stringByAppendingPathComponent:@"data.sqlite"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            sqlite3_close(_database);
            //NSAssert(0, @"Failed to open database");
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}


-(void)dealloc{
    sqlite3_close(_database);
    //[super dealloc];
}

- (NSArray *)failedBankInfos {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT id, name, city, state FROM failed_banks ORDER BY close_date DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            FailedBankInfo *info = [[FailedBankInfo alloc]
                                    initWithUniqueId:uniqueId name:name city:city state:state];
            [retval addObject:info];
            //[name release];
            //[city release];
            //[state release];
            //[info release];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (NSArray *)retornaInfoFields {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameCharsFieldData = (char *) sqlite3_column_text(statement, 1);

            NSString *name = [[NSString alloc] initWithUTF8String:nameCharsFieldData];
            
            
            FieldEntity *informacion = [[FieldEntity alloc] initWithUniqueId:uniqueId nameFieldData:name];
            [retval addObject:informacion];
            
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}












@end
