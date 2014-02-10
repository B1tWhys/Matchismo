//
//  SetGameViewController.h
//  Matchismo
//
//  Created by David Leserman on 6/5/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "CardGameViewController.h"
#import "SetCardMatchingGame.h"
#import "SetCard.h"

@interface SetGameViewController : CardGameViewController

+(NSString *)getCardString:(SetCard *)card;

@end
 