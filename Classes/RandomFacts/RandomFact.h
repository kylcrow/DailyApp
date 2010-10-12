//
//  RandomFact.h
//  DailyApp
//
//  Created by Kyle Crow on 10/11/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RandomFact : NSObject {
	NSString* fact;
	NSDate* date;
	NSInteger* visited;
}

@property (nonatomic, retain) NSString* fact;
@property (nonatomic, retain) NSDate* date;
@property (readwrite) NSInteger* visited;

-(id)initWithFact:(NSString *)f date:(NSDate *)d visited:(NSInteger *)v;


@end
