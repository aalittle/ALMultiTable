//
//  QuickTextViewCell.m
//  ALMultiTable
//
//  Created by Andrew Little on 10-08-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "QuickTextViewCell.h"


@implementation QuickTextViewCell

@synthesize quickTextField;

- (void)dealloc {
    
    [quickTextField release];
    [super dealloc];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)willTransitionToState:(UITableViewCellStateMask)state {
 
    [super willTransitionToState:state];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleBezel;
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

    textField.backgroundColor = [UIColor clearColor];
    textField.borderStyle = UITextBorderStyleNone;
    
    return YES;
}

@end
