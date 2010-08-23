//
//  QuickTextViewCell.h
//  ALMultiTable
//
//  Created by Andrew Little on 10-08-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QuickTextViewCell : UITableViewCell <UITextFieldDelegate>{

    UITextField *quickTextField;
}

@property (nonatomic, retain) IBOutlet UITextField *quickTextField;

@end
