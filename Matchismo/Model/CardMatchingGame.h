//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by David Leserman on 3/9/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property (nonatomic, readonly) int totalScore;
@property (nonatomic, readonly) NSString *flipResults;
@property (nonatomic, readonly) int flipCount;

// designated initializer
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

// SHIT - I needed to declare this public here in order to get
//        CardMatchingGame and TwoCardMatchingGame to see the
//        same instance of the method. This should be hidden
//        from all callers outside of CardMatchingGame and it's
//        subclasses.
- (NSMutableArray *) gameCards;

@end