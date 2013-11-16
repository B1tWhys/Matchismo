//
//  UISetCardButton.h
//  Matchismo
//
//  Created by Skyler Arnold on 11/1/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"

@interface UISetCardButton : UIButton

@property (strong, nonatomic) SetCard *card;
@property (strong, nonatomic) NSAttributedString *attributedStringContents;

@end
