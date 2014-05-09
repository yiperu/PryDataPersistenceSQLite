//
//  FieldTableViewController.h
//  PryDataPersistenceSQLite
//
//  Created by Henry AT on 5/9/14.
//  Copyright (c) 2014 Henry AT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FieldTableViewController : UITableViewController {
    NSArray *_failedBankInfos;
}

@property (nonatomic, retain) NSArray *failedBankInfos;

@end
