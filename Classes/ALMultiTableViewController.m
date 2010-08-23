//
//  ALMultiTableViewViewController.m
//  ALMultiTableView
//
//  Created by Andrew Little on 10-08-18.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "ALMultiTableViewController.h"
#import "QuickTextViewCell.h"

#pragma mark Private Methods Declarations

@interface ALMultiTableViewController()

- (NSMutableArray *)quickTextAssociatedWithTable:(UITableView *)table;
- (void)writeToPlist:(NSMutableArray *)theArray;

@end

@implementation ALMultiTableViewController

@synthesize tableCol0;
@synthesize tableCol1;
@synthesize tableCol2;
@synthesize tableCol3;
@synthesize tableCol4;

@synthesize quickTextJoiners;
@synthesize quickTextActions;
@synthesize quickTextPeople;
@synthesize quickTextThings;
@synthesize quickTextCompanies;


- (void)dealloc {
    
    [self.tableCol0 release];
    [self.tableCol1 release];
    [self.tableCol2 release];
    
    [self.quickTextActions release];
    [self.quickTextJoiners release];
    [self.quickTextPeople release];
    [self.quickTextThings release];
    [self.quickTextCompanies release];
    
    [super dealloc];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization   
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    
    
}
*/



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"QuickTextActions" ofType:@"plist"];        
    quickTextActions = [[NSMutableArray alloc] initWithContentsOfFile:path]; 

    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"QuickTextPeople" ofType:@"plist"];        
    quickTextPeople = [[NSMutableArray alloc] initWithContentsOfFile:path1]; 

    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"QuickTextThings" ofType:@"plist"];        
    quickTextJoiners = [[NSMutableArray alloc] initWithContentsOfFile:path2]; 

    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"QuickTextJoiners" ofType:@"plist"];        
    quickTextThings = [[NSMutableArray alloc] initWithContentsOfFile:path3]; 

    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"QuickTextCompanies" ofType:@"plist"];        
    quickTextCompanies = [[NSMutableArray alloc] initWithContentsOfFile:path4]; 

    tableCol0.editing = YES;
    tableCol1.editing = YES;
    tableCol2.editing = YES;
    tableCol3.editing = YES;
    tableCol4.editing = YES;
}
 


// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.tableCol0 = nil;
    self.tableCol1 = nil;
    self.tableCol2 = nil;
    self.tableCol3 = nil;
    self.tableCol4 = nil;
    
    
    
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [quickTextActions count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    QuickTextViewCell *cell = (QuickTextViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (QuickTextViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"QuickTextViewCell" owner:self options:nil]  lastObject];
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSMutableArray *quickText = [self quickTextAssociatedWithTable:tableView];
    cell.quickTextField.text = [quickText objectAtIndex:indexPath.row];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     // Return NO if you do not want the specified item to be editable.
     return YES;
}
 


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {

    //update the arrays
    NSMutableArray *quickText = [self quickTextAssociatedWithTable:tableView];
        
    NSString *quickTextValueToMove = [[quickText objectAtIndex:fromIndexPath.row] retain];
    [quickText removeObjectAtIndex:fromIndexPath.row];
    [quickText insertObject:quickTextValueToMove atIndex:toIndexPath.row];
    
    [self writeToPlist:quickText];
    
    [quickTextValueToMove release];
}
 



 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
     // Return NO if you do not want the item to be re-orderable.
     return YES;
 }
 


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return UITableViewCellEditingStyleNone;
}


#pragma mark Private Methods

- (NSMutableArray *)quickTextAssociatedWithTable:(UITableView *)table {
   
    if ([table isEqual:tableCol0]) {
        
        return quickTextActions;
    }
    else if ([table isEqual:tableCol1]) {
        
        return quickTextPeople;  
    }
    else if ([table isEqual:tableCol2]) {
        
        return quickTextJoiners;  
    }
    else if ([table isEqual:tableCol3]) {
        
        return quickTextThings;  
    }
    else {
        return quickTextCompanies;
    }
}

- (void)writeToPlist:(NSMutableArray *)theArray {
 
    NSString *path;
    
    if ([theArray isEqual:quickTextActions]) {
        path = [[NSBundle mainBundle] pathForResource:@"QuickTextActions" ofType:@"plist"]; 
    }
    else if ([theArray isEqual:quickTextPeople]) {
        path = [[NSBundle mainBundle] pathForResource:@"QuickTextPeople" ofType:@"plist"]; 
    }
    else if ([theArray isEqual:quickTextJoiners]) {
        path = [[NSBundle mainBundle] pathForResource:@"QuickTextJoiners" ofType:@"plist"]; 
    }
    else if ([theArray isEqual:quickTextThings]) {
        path = [[NSBundle mainBundle] pathForResource:@"QuickTextThings" ofType:@"plist"]; 
    }
    else {
        path = [[NSBundle mainBundle] pathForResource:@"QuickTextCompanies" ofType:@"plist"]; 
    }
    
    
    [theArray writeToFile:path atomically:YES];
}
@end
