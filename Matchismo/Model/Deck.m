//
//  Deck.m
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "Deck.h"
#import "PlayingCardDeck.h"
@interface Deck()
@property (strong, nonatomic) NSMutableArray *deckCards;
@property (strong, nonatomic) NSNumber *checkCount;
@end

@implementation Deck

-(id) init {
    self = [super init];
    if (self) { _checkCount = [[NSNumber alloc] initWithInt:0]; }
    return self;
}

-(void)checkDeck {
    int cc = [_checkCount intValue] + 1;
    _checkCount = [[NSNumber alloc] initWithInt:cc];
    NSLog(@"--- checkDeck --- %d", [_checkCount intValue]);
    int cardIndex = -1;
    for (Card *testCard in self.deckCards)
    {
        for (cardIndex = 0; cardIndex < 52; cardIndex++) {
            if (self.deckCards[cardIndex] == testCard) break;
        }
        if (!testCard) {
            int x = 1; // BREAKPOINT opportunity
            x = x;
        }
        else NSLog(@"%@ - index: %d", testCard.contents, cardIndex);
    }
}

-(NSMutableArray *)deckCards
{
    if (!_deckCards) {
        _deckCards = [[NSMutableArray alloc] init];
    }
    return _deckCards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.deckCards insertObject:card atIndex:0];
    } else {
        [self.deckCards addObject:card];
    }
//    [self checkDeck];
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    if ([self.deckCards count]) {
        unsigned index = arc4random() % self.deckCards.count;
        randomCard = self.deckCards[index];
        [self.deckCards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
