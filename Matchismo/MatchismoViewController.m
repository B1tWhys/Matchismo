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

@end

@implementation MatchismoViewController

//- (void)viewDidLoad
//{
//    [self updateUI];
//}

- (CardMatchingGame *) game
{
    if (!self.game) {
    }
    return self.game;
}

- (void)updateUI
{

}

- (IBAction)changeGameType:(id)sender {
    [self newGame:sender];
}

- (IBAction)flipCard:(UIButton *)sender
{
//    Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (IBAction)newGame:(UIButton *)sender
{
    self.game = 0;
    [self updateUI];
}

@end
