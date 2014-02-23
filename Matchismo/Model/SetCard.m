//
//  SetCard.m
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "SetCard.h"
@interface SetCard()
@property (nonatomic)int count; // 0 = undefined, 1-3 are valid values
@property (nonatomic)int shape; // 0 = undefined, 1 = square, 2 = circle, 3 = triangle
@property (nonatomic)int fill; // 0 = undefined, 1 = none, 2 = shaded, 3 = solid
@property (nonatomic)int color; // 0 = undefined, 1 = red, 2 = green, 3 = blue
@end

@implementation SetCard

-(id)init
{
    if (self = [super init]) {
        self.count = 0;
        self.shape = 0;
        self.fill = 0;
        self.color = 0;
    }
    return self;
}

- (id)initWithCount:(int)count shape:(int)shape fill:(int)fill color:(int)color
{
    if (self = [super init]) {
        self.count = count;
        self.shape = shape;
        self.fill = fill;
        self.color = color;
    }
    
    return self;
/*
 self = [super init];
    
    if (otherCards.count == 1) {
        SetCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
    } else if (otherCards.count == 2) { // means we have a 3 card matching game
        SetCard *secondCard = otherCards[0];
        SetCard *thirdCard = otherCards[1];
        if ([secondCard.suit isEqualToString:self.suit] && [thirdCard.suit isEqualToString:self.suit]) {
            score = 3;
        } else if ((secondCard.rank == self.rank) && (thirdCard.rank == self.rank)){
            score = 12;
        }
    }
    return score;
*/
}

- (void)logCard
{
    NSString *shapeString = @[@"X", @"square", @"circle", @"triangle"][self.shape];
    NSString *colorString = @[@"X", @"red", @"green", @"blue"][self.color];
    NSString *fillString = @[@"X", @"none", @"shaded", @"solid"][self.fill];
    NSLog(@"%i  %@  %@  %@  ", self.count, colorString, shapeString, fillString);
}

@end

// We need to implamant a SetCardButton derived fron UIButton that adds a method called contents, for instance.
