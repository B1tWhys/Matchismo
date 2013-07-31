//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by David Leserman on 3/9/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *gameCards;
@property (nonatomic, readwrite) int totalScore;
@property (nonatomic, readwrite) NSString *flipResults;
@property (nonatomic, readwrite) int flipCount;
@end

@implementation CardMatchingGame

//designated initializer
- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        self.flipCount = 0;
        self.flipResults = @"Flip a card!";
        self.totalScore = 0;
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.gameCards[i] = card;
            }
        }
    }
    return self;
}

- (NSMutableArray *) gameCards {
    if (!_gameCards)
        _gameCards = [[NSMutableArray alloc] init];
    return _gameCards;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.gameCards.count) ? self.gameCards[index] : nil;
}

- (void)flipCardAtIndex:(NSUInteger)index
{
}

@end