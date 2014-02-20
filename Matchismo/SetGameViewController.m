//
//  SetGameViewController.m
//  Matchismo
//
//  Created by David Leserman on 6/5/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardMatchingGame.h"
#import "SetCardDeck.h"

@interface SetGameViewController ()
@end

@implementation SetGameViewController

- (SetCardMatchingGame *) game
{
    if (!super.game) {
        SetCardDeck *scDeck = [[SetCardDeck alloc] init];
        super.game = [[SetCardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:scDeck];
    }
    return (SetCardMatchingGame *) super.game;
}

- (IBAction) newGame
{
    
}


+ (NSString *)getCardString:(SetCard *)card
{
    NSString *placeHolderVariable = [[NSString alloc] init];
    return placeHolderVariable;
}

- (IBAction)setCard:(UIButton *)sender
{
    [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];}

- (void)viewDidLoad
{
    [self updateUI];
	// Do any additional setup after loading the view.
}

- (NSString *)getDisplayCharacter:(int)shapeCode
{
    NSString *returnShape;
    switch (shapeCode) {
        case 1: returnShape = @"◼"; break;
        case 2: returnShape = @"●"; break;
        case 3: returnShape = @"▲"; break;
        default: returnShape = @"!"; break;
    }
    
    return returnShape;
}

- (UIColor *)getDisplayColor:(int)colorCode
{
    UIColor *color;
    switch (colorCode) {
        case 1: color = [UIColor redColor]; break;
        case 2: color = [UIColor greenColor]; break;
        case 3: color = [UIColor blueColor]; break;
        default: color = color = [UIColor magentaColor]; break;
    }
    return color;
}

- (UIColor *)getDisplayColorWithAlpha:(UIColor *)originalColor fillCode:(int)fillCode
{
    float alpha;
    switch (fillCode) {
        case 1:
            alpha = 0.0;
            break;
        case 2:
            alpha = 0.7;
            break;
        case 3:
            alpha = 1.0;
            break;
        default:
            alpha = -1.0;
            break;
    }
    UIColor *returnColor = [originalColor colorWithAlphaComponent:alpha];
    return returnColor;
}

- (NSString *) getDisplayString:(NSString *) shapeChar shapeCount:(int) numberOfShapes
{
    NSString *outputString = @"";
    for (int i = 1; i <= numberOfShapes; i++) {
        outputString = [NSString stringWithFormat:@"%@%@", outputString, shapeChar];
    }
    return outputString;
}

- (void)updateUI
{
    [super updateUI];
    // Compute and set the UI state for each cardButton.
    for (UIButton *cardButton in self.cardButtons) {
        SetCard *card = (SetCard *) [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        // get the count, shape, fill & color properties for the card and formulate
        // the attributed string for dispaly. TODO 2/15/14

        // count - 0 = undefined, 1-3 are valid values
        // shape - 0 = undefined, 1 = square, 2 = circle, 3 = triangle
        // fill - 0 = undefined, 1 = none, 2 = shaded, 3 = solid
        // color - 0 = undefined, 1 = red, 2 = green, 3 = blue
        
        NSString *shapeCharacter = [self getDisplayCharacter:card.shape];
        NSString *displayString = [self getDisplayString:shapeCharacter shapeCount:card.count];
        UIColor *color = [self getDisplayColor:card.color];
        UIColor *colorWithAlpha = [self getDisplayColorWithAlpha:color fillCode:card.fill];
        
        
        
        NSAttributedString *cardText = [[NSAttributedString alloc] initWithString:displayString attributes:@{NSForegroundColorAttributeName: colorWithAlpha}];
        [cardButton setAttributedTitle:cardText forState:UIControlStateNormal];

    }
}

@end
