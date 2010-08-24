//
//  ALMultiTableViewViewController.h
//  ALMultiTableView
//
//  Created by Andrew Little on 10-08-18.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALMultiTableViewController : UIViewController { //<UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *tableCol0;
    UITableView *tableCol1;
    UITableView *tableCol2;
    UITableView *tableCol3;
    UITableView *tableCol4;
    
    UIButton *editControl;
    
@private
    //Data for the demo
    NSMutableArray *quickTextActions;
    NSMutableArray *quickTextPeople;
    NSMutableArray *quickTextJoiners;
    NSMutableArray *quickTextThings;
    NSMutableArray *quickTextCompanies;
}

@property (nonatomic, retain) IBOutlet UITableView *tableCol0;
@property (nonatomic, retain) IBOutlet UITableView *tableCol1;
@property (nonatomic, retain) IBOutlet UITableView *tableCol2;
@property (nonatomic, retain) IBOutlet UITableView *tableCol3;
@property (nonatomic, retain) IBOutlet UITableView *tableCol4;

@property (nonatomic, retain) IBOutlet UIButton *editControl;


@property (nonatomic, retain) NSMutableArray *quickTextActions;
@property (nonatomic, retain) NSMutableArray *quickTextPeople;
@property (nonatomic, retain) NSMutableArray *quickTextJoiners;
@property (nonatomic, retain) NSMutableArray *quickTextThings;
@property (nonatomic, retain) NSMutableArray *quickTextCompanies;

-(IBAction)touchEditControl;

@end

