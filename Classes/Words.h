//
//  Words.h
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Words : NSObject {

	NSString* words;
	NSDate* date;
	NSInteger* visited;
}

@property (nonatomic, retain) NSString* words;
@property (nonatomic, retain) NSDate* date;
@property (readwrite) NSInteger* visited;

-(id)initWithWords:(NSString *)w date:(NSDate *)d visited:(NSInteger *)v;


@end
