//
//  TwoCardMatchingGame.m
//  Matchismo
//
//  Created by David Leserman on 3/9/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "TwoCardMatchingGame.h"
#import "PlayingCard.h"
@interface TwoCardMatchingGame()
//@property (strong, nonatomic) NSMutableArray *gameCards;
@property (nonatomic, readwrite) int totalScore;
@property (nonatomic, readwrite) NSString *flipResults;
@property (nonatomic, readwrite) int flipCount;
@end

@implementation TwoCardMatchingGame

// designated initializer
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self = [super initWithCardCount:cardCount usingDeck:deck];
    return (TwoCardMatchingGame *) self;
}

#define FLIP_COST 1
#define MATCH_BONUS_MULTIPLIER 4
#define MISMATCH_PENALTY 2

- (void)flipCardAtIndex:(NSUInteger)index
{
    PlayingCard *card = (PlayingCard *) [self cardAtIndex:index];
    [card flip];
    if (card.isPlayable && card.isFaceUp) {
        self.flipCount++;
        self.totalScore -= FLIP_COST;
        int lastTwoCardsFlippedScore = -FLIP_COST;
        self.flipResults = @"Flip a card!";
        // see if flipping this card up creates a match
        for (PlayingCard *otherCard in [self gameCards]) {
            if ((otherCard != card) && otherCard.isFaceUp && otherCard.isPlayable) {
                int matchScore = [card match:@[otherCard]];
                if (matchScore) {
                    otherCard.playable = NO;
                    card.playable = NO;
                    self.totalScore += matchScore * MATCH_BONUS_MULTIPLIER;
                    lastTwoCardsFlippedScore += matchScore * MATCH_BONUS_MULTIPLIER;
                    self.flipResults = [NSString stringWithFormat: @"Matched %@ and %@ for %u points!", card.contents, otherCard.contents, lastTwoCardsFlippedScore];
                } else {
                    otherCard.faceUp = NO;     // === [otherCard flip]
                    self.totalScore -= MISMATCH_PENALTY;
                    self.flipResults = [NSString stringWithFormat: @"%@ and %@ don't match! 2 point penalty!", card.contents, otherCard.contents];
                }
                break;
            }
        }
    }
}

@end