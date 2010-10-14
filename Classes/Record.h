//
//  Record.h
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Record : NSObject {

	NSString* record;
	NSDate* date;
	NSInteger* visited;
}

@property (nonatomic, retain) NSString* record;
@property (nonatomic, retain) NSDate* date;
@property (readwrite) NSInteger* visited;

-(id)initWithRecord:(NSString *)r date:(NSDate *)d visited:(NSInteger *)v;


@end
