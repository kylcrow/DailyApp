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
}

@property (nonatomic, retain) IBOutlet UILabel *pageNumberLabel;

- (id)initWithPageNumber:(int)page;

@end
