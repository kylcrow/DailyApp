//
//  Challenges.m
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "Challenges.h"


@implementation Challenges

@synthesize challenges, date, visited;

-(id)initWithChallenges:(NSString *)c date:(NSDate *)d visited:(NSInteger *)v {
	self.challenges = c;
	self.date = d;
	self.visited = v;
	return self;
}


@end
