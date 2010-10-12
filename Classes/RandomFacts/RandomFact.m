//
//  RandomFact.m
//  DailyApp
//
//  Created by Kyle Crow on 10/11/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "RandomFact.h"

@implementation RandomFact
@synthesize fact, date, visited;

-(id)initWithFact:(NSString *)f date:(NSDate *)d visited:(NSInteger *)v {
	self.fact = f;
	self.date = d;
	self.visited = v;
	return self;
}


@end
