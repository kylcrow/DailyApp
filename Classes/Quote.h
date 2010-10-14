//
//  Quote.h
//  DailyApp
//
//  Created by Zach Gebhardt on 10/14/10.
//  Copyright 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Quote : NSObject {
	NSString* quote;
	NSDate* date;
	NSInteger* visited;
}

@property (nonatomic, retain) NSString* quote;
@property (nonatomic, retain) NSDate* date;
@property (readwrite) NSInteger* visited;

-(id)initWithQuote:(NSString *)q date:(NSDate *)d visited:(NSInteger *)v;


@end
