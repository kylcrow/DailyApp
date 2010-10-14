//
//  Record.m
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "Record.h"


@implementation Record

@synthesize record, date, visited;

-(id)initWithRecord:(NSString *)r date:(NSDate *)d visited:(NSInteger *)v {
	self.record = r;
	self.date = d;
	self.visited = v;
	return self;
}


@end
