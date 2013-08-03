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

@interface MatchismoViewController ()

@end

@implementation MatchismoViewController

// test comment
// test comment with git acount "leserman" at 4:18
// test comment with git account "leserman at 4:23 on 8/3/13

- (void)viewDidLoad
{
    //    [self game];
    self.cardBackImage = [UIImage imageNamed:@"Bicycle-Rider-Backs.gif"];
    [self updateUI];
    [self makeAllCardsHaveCardBackImage];
}

- (CardMatchingGame *) game
{
    if (!_game) {
        PlayingCardDeck *pcdeck = [[PlayingCardDeck alloc] init];
        //        [pcdeck checkDeck];
        if (self.twoOrThreeCardMatchingGame.selectedSegmentIndex == 0) {
            _game = [[TwoCardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:pcdeck];
            
        } else {// 3 card matching game
            _game = [[ThreeCardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:pcdeck];
        }
    }
    return _game;
}

- (void)updateUI
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.totalScore];
    self.flipResult.text = [self.game flipResults];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.game.flipCount];
    // Compute and set the UI state for each cardButton.
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
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

- (IBAction)changeGameType:(id)sender {
    [self newGame:sender];
}

- (IBAction)flipCard:(UIButton *)sender
{
    Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self displayCardImage:sender isFaceUp:card.isFaceUp];
    [self updateUI];
    if (self.twoOrThreeCardMatchingGame.enabled == YES) {
        self.twoOrThreeCardMatchingGame.enabled = NO;
    }
}

- (void)displayCardImage:(UIButton *) cardButton isFaceUp:(BOOL) faceUp
{
    if (!faceUp) {
        [cardButton setImage:self.cardBackImage forState:UIControlStateNormal];// if face down
    } else {
        [cardButton setImage:nil forState:UIControlStateNormal];// if face up
        
    }
}

- (void)makeAllCardsHaveCardBackImage{
    for (UIButton *cardButton in self.cardButtons) {
        [cardButton setImage:self.cardBackImage forState:UIControlStateNormal];
    }
}

- (IBAction)newGame:(UIButton *)sender
{
    self.game = 0;
    self.flipsLabel.text = @"Flips: 0";
    [self makeAllCardsHaveCardBackImage];
    [self updateUI];
    self.twoOrThreeCardMatchingGame.enabled = YES;
}

@end
