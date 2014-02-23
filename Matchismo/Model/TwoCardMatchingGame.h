//
//  TwoCardMatchingGame.h
//  Matchismo
//
//  Created by David Leserman on 3/9/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import "Deck.h"
#import "CardMatchingGame.h"

@interface TwoCardMatchingGame : CardMatchingGame
@property (nonatomic, readonly) int totalScore;
@property (nonatomic, readonly) NSString *flipResults;
@property (nonatomic, readonly) int flipCount;

@end