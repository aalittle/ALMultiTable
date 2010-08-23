//
//  ALMultiTableAppDelegate.h
//  ALMultiTable
//
//  Created by Andrew Little on 10-08-18.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALMultiTableViewController;

@interface ALMultiTableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ALMultiTableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ALMultiTableViewController *viewController;

@end

