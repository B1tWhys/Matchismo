//
//  Card.m
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "Card.h"

@implementation Card

- (Card *)init {
    self = [super init];
    if (self) _playable = YES;
    return self;
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

//- (int)match:(NSArray *)otherCards {
//    int score = 0;
//    if ([otherCards count] == 1) {
//        for (Card *card in otherCards) {
//            if ([card.contents isEqualToString:self.contents]) {
//                score = 1;
//            }
//        }
//    } else {
//        for (Card *card in otherCards) {
//            if ([card.contents isEqualToString:self.contents]) {
//                score = 1;
//            }
//        }
//    }
//    
//    return score;
//}

- (void)flip {
    _faceUp = !_faceUp;
}

@end
