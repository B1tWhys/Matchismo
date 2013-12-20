//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Skyler Arnold on 12/5/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

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
