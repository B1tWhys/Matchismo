//
//  SetCard.m
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "SetCard.h"
@interface SetCard()

@end

@implementation SetCard
@synthesize count = _count;
@synthesize shape = _shape;
@synthesize fill = _fill;
@synthesize color = _color;

- (id)initWithCount:(int)count shape:(int)shape fill:(int)fill color:(int)color
{
    self = [super init];
    
    if (self) {
        self.count = count;
        self.shape = shape;
        self.fill = fill;
        self.color = color;
    }
    return self;
}


- (int)match:(NSArray *)otherCards
{
    int score = 0;

    return score;
}

- (NSString *)contents
{
//	NSArray *rankStrings = [PlayingCard rankStrings];
//	return [rankStrings[self.rank] stringByAppendingString:self.suit];
    return @"";
}

@end

// We need to implamant a SetCardButton derived fron UIButton that adds a method called contents, for instance.