//
//  ThreeCardMatchingGame.m
//  Matchismo
//
//  Created by David Leserman on 5/15/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "ThreeCardMatchingGame.h"
@interface ThreeCardMatchingGame()
//@property (strong, nonatomic) NSMutableArray *gameCards;
@property (nonatomic, readwrite) int totalScore;
@property (nonatomic, readwrite) NSString *flipResults;
@property (nonatomic, readwrite) int flipCount;
@end

@implementation ThreeCardMatchingGame

// designated initializer
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self = [super initWithCardCount:cardCount usingDeck:deck];
    return (ThreeCardMatchingGame *) self;
}

#define FLIP_COST 1
#define MATCH_BONUS_MULTIPLIER 4
#define MISMATCH_PENALTY 2

- (void)flipCardAtIndex:(NSUInteger)index
{
//    Card *card = [self cardAtIndex:index];
//    [card flip];
//    if (card.isPlayable && card.isFaceUp) {
//        self.flipCount++;
//        self.totalScore -= FLIP_COST;
//        int lastThreeCardsFlippedScore = -FLIP_COST;
//        self.flipResults = @"Flip a card!";
//        Card *secondCard = nil;
//        Card *thirdCard = nil;
//        // see if flipping this card up creates a match
//        for (Card *otherCard in [self gameCards]) {
//            if ((otherCard != card) && otherCard.isFaceUp && otherCard.isPlayable) {
//                if (secondCard == nil){
//                    secondCard = otherCard;
//                } else {
//                    thirdCard = otherCard;
//                    int matchScore = [card match:@[secondCard, thirdCard]];
//                    if (matchScore) {
//                        card.playable = NO;
//                        secondCard.playable = NO;
//                        thirdCard.playable = NO;
//                        self.totalScore += matchScore * MATCH_BONUS_MULTIPLIER;
//                        lastThreeCardsFlippedScore += matchScore * MATCH_BONUS_MULTIPLIER;
//                        self.flipResults = [NSString stringWithFormat: @"Matched %@, %@ and %@ for %u points!", card.contents, secondCard.contents, thirdCard.contents,  lastThreeCardsFlippedScore];
//                    } else {
//                        secondCard.faceUp = NO;
//                        thirdCard.faceUp = NO;
//                        self.totalScore -= MISMATCH_PENALTY;
//                        self.flipResults = [NSString stringWithFormat: @"%@, %@ and %@ don't match! 2 point penalty!", card.contents, secondCard.contents, thirdCard.contents];
//                    }
//                    break;
//                }
//
//            }
//        }
//    }
}
@end
