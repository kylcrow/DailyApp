//
//  DailyAppAppDelegate.h
//  DailyApp
//
//  Created by Kyle Crow on 10/2/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface DailyAppAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, UIScrollViewDelegate> {
    UIWindow *window;
	UIScrollView *scrollView;
	UIPageControl *pageControl;
    NSMutableArray *viewControllers;
	BOOL pageControlUsed;
	
	// Database variables
	NSString *databaseName;
	NSString *databasePath;
	
	// Array to store the animal objects
	NSMutableArray *randomFacts;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIButton *btnPage1;
@property (nonatomic, retain) IBOutlet UIButton *btnPage2;
@property (nonatomic, retain) IBOutlet UIButton *btnPage3;
@property (nonatomic, retain) IBOutlet UIButton *btnPage4;
@property (nonatomic, retain) IBOutlet UIButton *btnPage5;
@property (nonatomic, retain) IBOutlet UIButton *btnPage6;

@property (nonatomic, retain) NSMutableArray *randomFacts;

- (IBAction)changePage:(id)sender;
- (IBAction)gotoPageOne:(id)sender;
- (IBAction)gotoPageTwo:(id)sender;
- (IBAction)gotoPageThree:(id)sender;
- (IBAction)gotoPageFour:(id)sender;
- (IBAction)gotoPageFive:(id)sender;
- (IBAction)gotoPageSix:(id)sender;

@end
