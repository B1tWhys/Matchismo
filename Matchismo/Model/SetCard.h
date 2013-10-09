//
//  SetCard.h
//  Matchismo
//
//  Created by Skyler Arnold on 8/21/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic)int count;
@property (nonatomic)int shape; // 0 = undefined, 1 = square, 2 = circle, 3 = triangle
@property (nonatomic)int fill; // 0 = undefined, 1 = none, 2 = shaded, 3 = solid
@property (nonatomic)int color; // 0 = undefined, 1 = red, 2 = green, 3 = blue

@end