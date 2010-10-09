//
//  DailyAppAppDelegate.h
//  DailyApp
//
//  Created by Kyle Crow on 10/2/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyAppAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, UIScrollViewDelegate> {
    UIWindow *window;
	UIScrollView *scrollView;
	UIPageControl *pageControl;
    NSMutableArray *viewControllers;
	BOOL pageControlUsed;
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

- (IBAction)changePage:(id)sender;
- (IBAction)gotoPageSix:(id)sender;

@end
