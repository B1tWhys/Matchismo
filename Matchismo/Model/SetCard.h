//
//  SetCard.h
//  Matchismo
//
//  Created by Skyler Arnold on 8/21/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic, readonly)int count; // 0 = undefined, 1-3 are valid values
@property (nonatomic, readonly)int shape; // 0 = undefined, 1 = square, 2 = circle, 3 = triangle
@property (nonatomic, readonly)int fill; // 0 = undefined, 1 = none, 2 = shaded, 3 = solid
@property (nonatomic, readonly)int color; // 0 = undefined, 1 = red, 2 = green, 3 = blue


- (id)initWithCount:(int)count shape:(int)shape fill:(int)fill color:(int)color;
@end