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
    UITabBarController *tabBarController;
	UIScrollView *scrollView;
	UIPageControl *pageControl;
    NSMutableArray *viewControllers;
	
	BOOL pageControlUsed;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;


- (IBAction)changePage:(id)sender;

@end
