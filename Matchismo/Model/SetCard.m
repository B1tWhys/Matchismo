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

-(id)init
{
    if (self = [super init]) {
        self.suit = [[NSString alloc] init];
        self.rank = 0;
    }
    return self;
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
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
}

- (NSString *)contents
{
	NSArray *rankStrings = [SetCard rankStrings];
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray*)validSuits
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

-  (void) setSuit:(NSString *)suit
{
    if ([[SetCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
	return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank
{
	if (rank <= [SetCard maxRank]) {
		_rank = rank;
	}
}

@end
