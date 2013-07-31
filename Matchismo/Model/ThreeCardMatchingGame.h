//
//  ThreeCardMatchingGame.h
//  Matchismo
//
//  Created by David Leserman on 5/15/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "CardMatchingGame.h"

@interface ThreeCardMatchingGame : CardMatchingGame
@property (nonatomic, readonly) int totalScore;
@property (nonatomic, readonly) NSString *flipResults;
@property (nonatomic, readonly) int flipCount;

@end
