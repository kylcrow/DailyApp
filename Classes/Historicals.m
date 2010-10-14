//
//  Historicals.m
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "Historicals.h"


@implementation Historicals

@synthesize historicals, date, visited;

-(id)initWithHistoricals:(NSString *)h date:(NSDate *)d visited:(NSInteger *)v {
	self.historicals = h;
	self.date = d;
	self.visited = v;
	return self;
}


@end
