//
//  UISetCardButton.m
//  Matchismo
//
//  Created by Skyler Arnold on 11/1/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "UISetCardButton.h"
#import "SetCard.h"

@implementation UISetCardButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.card = [[SetCard alloc] init];
    }
    return self;
}

// // Yipes! See comment in the .h file.
- (void)setPropertyCard:(SetCard *)card
{
    _card = card;
//    self.attributedStringContents = [[NSAttributedString alloc] initWithString:[self.card contents] attributes:<#(NSDictionary *)#>] ??????
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
