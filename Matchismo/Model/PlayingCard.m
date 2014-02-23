//
//  PlayingCard.m
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "PlayingCard.h"
@interface PlayingCard()

@end

@implementation PlayingCard
// The following 2 lines were commented out and David restored them on 11/27/13
@synthesize suit = _suit;
@synthesize rank = _rank;

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
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
    } else if (otherCards.count == 2) { // means we have a 3 card matching game
        PlayingCard *secondCard = otherCards[0];
        PlayingCard *thirdCard = otherCards[1];
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
	NSArray *rankStrings = [PlayingCard rankStrings];
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray*)validSuits
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

-  (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        // as for rank, use: (11/27/13)
        _suit = suit;
        // rather than
//        self.suit = suit;
    }
}

- (NSString *)suit
{
    // 11/27/13 - Here again, the next line makes a recursive call exhausting memory
//    return self.suit ? self.suit : @"?";
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
	if (rank <= [PlayingCard maxRank]) {
        // self.rank implicitly calls setRank, a recursive call that exhausts memory (11/27/13)
//		self.rank = rank;
        // rather, use: (11/27/13)
		_rank = rank;
	}
}

- (void)logCard
{
}

@end
