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
    return (SetCardMatchingGame *) self;
}

// Note:
//  removeObjectAtIndex():
//  Removes the object at index.
//  To fill the gap, all elements beyond index are moved by subtracting 1 from their index.

- (BOOL)isMatch
{
    // They all have the same shading, or they have three different shadings.
    // They all have the same color, or they have three different colors.
    
    BOOL match = NO;

    SetCard *card1 = self.currentlySelectedCards[0];
    SetCard *card2 = self.currentlySelectedCards[1];
    SetCard *card3 = self.currentlySelectedCards[2];
    // They all have the same number, or they have three different numbers.
    if (card1.count == card2.count && card2.count == card3.count) match = YES;
    if (card1.count != card2.count && card2.count != card3.count && card1.count != card3.count) match = YES;
    // They all have the same symbol, or they have three different symbols.
    if (card1.shape == card2.shape && card2.shape == card3.shape) match = YES;
    if (card1.shape != card2.shape && card2.shape != card3.shape && card1.shape != card3.shape) match = YES;
    if (card1.color == card2.color && card2.color == card3.color) match = YES;
    if (card1.color != card2.color && card2.color != card3.color && card1.color != card3.color) match = YES;
    if (card1.fill == card2.fill && card2.fill == card3.fill) match = YES;
    if (card1.fill != card2.fill && card2.fill != card3.fill && card1.fill != card3.fill) match = YES;
}

- (void)selectCardAtIndex:(NSUInteger)index
{
    Card *currentCard = [self cardAtIndex:index];
    
    BOOL cardIsValid = [currentCard isPlayable] && ![self.currentlySelectedCards containsObject:currentCard];
    
    if (cardIsValid) {
        [self.currentlySelectedCards addObject:currentCard];
        
        if ([self.currentlySelectedCards count] == 3) {
            // compute score
            //<#statements#>
        }
    }
    
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
