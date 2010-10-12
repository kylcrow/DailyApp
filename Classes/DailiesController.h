//
//  DailiesController.h
//  DailyApp
//
//  Created by Kyle Crow on 10/2/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DailiesController : UIViewController {
    UILabel *pageNumberLabel;
    int pageNumber;
	UITextField *txtRandomFact;

	// Database variables
	NSString *databaseName;
	NSString *databasePath;
	
}

@property (nonatomic, retain) IBOutlet UILabel *pageNumberLabel;
@property (nonatomic, retain) IBOutlet UITextField *txtRandomFact;


- (id)initWithPageNumber:(int)page;

@end
