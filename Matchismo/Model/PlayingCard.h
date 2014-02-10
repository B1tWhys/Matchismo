//
//  PlayingCard.h
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
