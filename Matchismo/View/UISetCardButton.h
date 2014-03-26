//
//  UISetCardButton.h
//  Matchismo
//
//  Created by Skyler Arnold on 11/1/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"

// Yipes! We're not sure why we created this class. Maybe it has something to do with
// the fact that the button has an attributedString instead of a normal string.

@interface UISetCardButton : UIButton

@property (strong, nonatomic) SetCard *card;
@property (strong, nonatomic) NSAttributedString *attributedStringContents;

@end
