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
        UIView *accessoryView = [[UIView alloc] initWithFrame:self.frame];
        accessoryView.backgroundColor = [UIColor redColor];
        self.accessoryView = accessoryView;
        
        [accessoryView release];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    if (!self.editing) {
        
        quickTextField.userInteractionEnabled = NO; 
        [quickTextField endEditing:YES];
    }
    else {
        quickTextField.userInteractionEnabled = YES; 
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)willTransitionToState:(UITableViewCellStateMask)state {
 
    [super willTransitionToState:state];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleBezel;
    //self.editing = NO;
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

    textField.backgroundColor = [UIColor clearColor];
    textField.borderStyle = UITextBorderStyleNone;
    //self.editing = YES;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
 
    [textField resignFirstResponder]; 
    
    return YES;
}

@end
