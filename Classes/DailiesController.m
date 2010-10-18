//
//  DailiesController.m
//  DailyApp
//
//  Created by Kyle Crow on 10/2/10.
//  Copyright 2010 Student. All rights reserved.
//

#include <stdlib.h>

#import "DailiesController.h"
#import "DailyAppAppDelegate.h"
#import "RandomFact.h"
#import "Quote.h"

static NSArray *__pageControlColorList = nil;


@implementation DailiesController

@synthesize pageNumberLabel, txtRandomFact;

// Creates the color list the first time this method is invoked. Returns one color object from the list.
+ (UIColor *)pageControlColorWithIndex:(NSUInteger)index {
    if (__pageControlColorList == nil) {
        __pageControlColorList = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor magentaColor],
                                  [UIColor blueColor], [UIColor orangeColor], [UIColor brownColor], nil];
    }
	
    // Mod the index by the list length to ensure access remains in bounds.
    return [__pageControlColorList objectAtIndex:index % [__pageControlColorList count]];
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
	pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", pageNumber + 1];
    self.view.backgroundColor = [DailiesController pageControlColorWithIndex:pageNumber];

	DailyAppAppDelegate *del = (DailyAppAppDelegate *)[[UIApplication sharedApplication] delegate];
	RandomFact *temp = (RandomFact *)[del.randomFacts objectAtIndex:arc4random() % 3];
	Quote *temp2 = (Quote *)[del.quotes objectAtIndex:arc4random() % 3];
	
	if (del.count == 0) {
		txtRandomFact.text = temp.fact;
	} 
	if (del.count == 1) {
		txtRandomFact.text = temp2.quote;
	} 
	if (del.count == 2) {
		txtRandomFact.text = temp.fact;
	} 
	if (del.count == 3) {
		txtRandomFact.text = temp2.quote;
	} 
	if (del.count == 4) {
		txtRandomFact.text = temp.fact;
	} 
	if (del.count == 5) {
		txtRandomFact.text = temp2.quote;
	} 
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

// Load the view nib and initialize the pageNumber ivar.
- (id)initWithPageNumber:(int)page {
    if (self = [super initWithNibName:@"Dailies" bundle:nil]) {
        pageNumber = page;
    }
    return self;
}


- (void)dealloc {
    [super dealloc];
}

@end
