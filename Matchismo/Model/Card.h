//
//  Card.h
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isPlayable) BOOL playable;

- (Card *)init;

- (int)match:(NSArray *)otherCards;

- (void) flip;

@end
