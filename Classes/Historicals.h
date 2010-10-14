//
//  Historicals.h
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Historicals : NSObject {

	NSString* historicals;
	NSDate* date;
	NSInteger* visited;
}

@property (nonatomic, retain) NSString* historicals;
@property (nonatomic, retain) NSDate* date;
@property (readwrite) NSInteger* visited;

-(id)initWithHistoricals:(NSString *)h date:(NSDate *)d visited:(NSInteger *)v;


@end
