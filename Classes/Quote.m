//
//  Quote.m
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "Quote.h"


@implementation Quote
@synthesize quote, date, visited;

-(id)initWithQuote:(NSString *)q date:(NSDate *)d visited:(NSInteger *)v {
	self.quote = q;
	self.date = d;
	self.visited = v;
	return self;
}


@end
