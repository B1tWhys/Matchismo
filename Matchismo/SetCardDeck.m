//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Skyler Arnold on 10/23/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "SetCardDeck.h"
#import "Deck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id)init
{
    self = [super init];
    
    if (self) {
        for (int currentCount = 1; currentCount <= 3; currentCount++) {
            for (int currentShape = 1; currentShape <= 3; currentShape++) {
                for (int currentFill = 1; currentFill <= 3; currentFill++) {
                    for (int currentColor = 1; currentColor <= 3; currentColor++) {
                        SetCard *card = [[SetCard alloc] initWithCount:currentCount shape:currentShape fill:currentFill color:currentColor];
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
            
    }
    return self;// class *variable = [[class alloc] init];
}
    

@end
