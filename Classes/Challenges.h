//
//  Challenges.h
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Challenges : NSObject {

	NSString* challenges;
	NSDate* date;
	NSInteger* visited;
}

@property (nonatomic, retain) NSString* challenges;
@property (nonatomic, retain) NSDate* date;
@property (readwrite) NSInteger* visited;

-(id)initWithChallenges:(NSString *)c date:(NSDate *)d visited:(NSInteger *)v;


@end
