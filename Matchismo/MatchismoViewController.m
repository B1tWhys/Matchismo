//
//  MatchismoViewController.m
//  Matchismo
//
//  Created by David Leserman on 6/5/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "MatchismoViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"
#import "TwoCardMatchingGame.h"
#import "CardGameViewController.h"

@interface MatchismoViewController ()
@property (strong, nonatomic) UIImage *cardBackImage;
@end

@implementation MatchismoViewController

- (void)viewDidLoad
{
    self.cardBackImage = [UIImage imageNamed:@"Bicycle-Rider-Backs.gif"];
    [self updateUI];
    [self makeAllCardsHaveCardBackImage];
}

- (IBAction)newGame:(UIButton *)sender
{
    self.game = 0;
    self.flipsLabel.text = @"Flips: 0";
    [self makeAllCardsHaveCardBackImage];
    [self updateUI];
}

- (void)updateUI
{
    [super updateUI];
    // Compute and set the UI state for each cardButton.
    for (UIButton *cardButton in self.cardButtons) {
        PlayingCard *card = (PlayingCard *)[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    	[cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        BOOL beforeChange = cardButton.selected;
        // selected, enabled, and alpha are visible UI states set to match the model's state.
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = card.playable;
        cardButton.alpha = card.playable ? 1.0 : 0.3;
        BOOL afterChange = cardButton.selected;
        if (beforeChange != afterChange)
        {
            [self displayCardImage:cardButton isFaceUp:card.isFaceUp];
        }
    }

}

- (void)makeAllCardsHaveCardBackImage{
    for (UIButton *cardButton in self.cardButtons) {
        [cardButton setImage:self.cardBackImage forState:UIControlStateNormal];
    }
}

- (IBAction)changeGameType:(id)sender {
    [self newGame:sender];
}

- (IBAction)flipCard:(UIButton *)sender
{
    Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self displayCardImage:sender isFaceUp:card.isFaceUp];
    [self updateUI];
}



- (void)displayCardImage:(UIButton *) cardButton isFaceUp:(BOOL) faceUp
{
    if (!faceUp) {
        [cardButton setImage:self.cardBackImage forState:UIControlStateNormal];// if face down
    } else {
        [cardButton setImage:nil forState:UIControlStateNormal];// if face up
        
    }
}



@end
