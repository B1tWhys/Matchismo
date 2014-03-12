//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Skyler Arnold on 12/5/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "SetCard.h"
#import "SetCardMatchingGame.h"

@interface SetCardMatchingGame()
@property (nonatomic, strong) NSMutableArray *currentlySelectedCards;
@property (nonatomic, readwrite) int totalScore;
@property (nonatomic, readwrite) NSString *flipResults;
@property (nonatomic, readwrite) int flipCount;
@end

@implementation SetCardMatchingGame

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super initWithCardCount:cardCount usingDeck:deck];
    self.currentlySelectedCards = [[NSMutableArray alloc] init];
    return (SetCardMatchingGame *) self;
}

// - (void)displayCardImage:(UIButton *) cardButton isFaceUp:(BOOL) faceUp

// Note:
//  removeObjectAtIndex():
//  Removes the object at index.
//  To fill the gap, all elements beyond index are moved by subtracting 1 from their index.



// Returns YES if all three inputs have the same value or they all have different values. Else returns NO.
- (BOOL)isMatchOnProperty1:(int) prop1 property2:(int) prop2 property3:(int) prop3
{
    BOOL match;
    if (prop1 == prop2 && prop2 == prop3) match = YES;
    else if (prop1 != prop2 && prop2 != prop3 && prop1 != prop3) match = YES;
    else match = NO;
    return match;
}

- (BOOL)isMatch
{
    SetCard *card1 = self.currentlySelectedCards[0];
    SetCard *card2 = self.currentlySelectedCards[1];
    SetCard *card3 = self.currentlySelectedCards[2];
    
    BOOL numberMatch = [self isMatchOnProperty1: card1.count property2: card2.count property3: card3.count];
    BOOL shapeMatch = [self isMatchOnProperty1: card1.shape property2: card2.shape property3: card3.shape];
    BOOL colorMatch = [self isMatchOnProperty1: card1.color property2: card2.color property3: card3.color];
    BOOL fillMatch = [self isMatchOnProperty1: card1.fill property2: card2.fill property3: card3.fill];

    return (numberMatch || shapeMatch || colorMatch || fillMatch);
}

#define SELECT_COST 1
#define MATCH_SCORE 5
#define MATCH_BONUS_MULTIPLIER 4 // N/A right now
#define MISMATCH_PENALTY 2


- (void)selectCardAtIndex:(NSUInteger)index
{
    int x = 0;
    Card *currentCard = [self cardAtIndex:index];
    
    BOOL cardIsValid = [currentCard isPlayable] && ![self.currentlySelectedCards containsObject:currentCard];
    
    if (cardIsValid) {
        [self.currentlySelectedCards addObject:currentCard];
        
        self.totalScore -= SELECT_COST;
        
        if ([self.currentlySelectedCards count] == 3) {
            // compute score
            if ([self isMatch]) {
                self.totalScore += MATCH_SCORE;
                [self.currentlySelectedCards removeAllObjects];

            } else {
                self.totalScore -= MISMATCH_PENALTY;
                // in this case, the last card to be selected remains selected and the other cards are set deselected in the UI and removed from currentlySelectedCards.
                [self.currentlySelectedCards removeObjectAtIndex:0];
                [self.currentlySelectedCards removeObjectAtIndex:0];
            }
        } // else do nothing
        
    } 	// else do nothing
    
    // 1/8/14 - We need to maintain gameCards (wherever that's stored).
    // Properly set the playable property.
    
    // Maintain currentlySelectedCards array
    // We decide that for no match, the last card to be selected remains selected and the other cards are set deselected in the UI and removed from currentlySelectedCards.
    // We decide that the user can deselect a card.
    
    
    
    
//     make a card which is the same as the passed in card
//     flip the card
//     if (card is playable) {
//        set up scoring variable
//        find and get the value of other cards which are being compaired {
//            if it's a match
//                make the cards unplayable
//                add 4 to score
//        else (no match)
//                flip the card back to face down
//                subtract 3 from score
//        }
//     }
}

@end
