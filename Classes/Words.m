//
//  Words.m
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "Words.h"


@implementation Words

@synthesize words, date, visited;

-(id)initWithWords:(NSString *)w date:(NSDate *)d visited:(NSInteger *)v {
	self.words = w;
	self.date = d;
	self.visited = v;
	return self;
}


@end

