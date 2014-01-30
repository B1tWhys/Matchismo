//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Skyler Arnold on 2/16/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"
#import "TwoCardMatchingGame.h"
#import "ThreeCardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipResult;
@end

@implementation CardGameViewController

- (void) newGame:(UIButton *)sender
{
    // not implemented here, but rather in the subclasses
}

- (CardMatchingGame *) game
{
    if (!_game) {
        PlayingCardDeck *pcdeck = [[PlayingCardDeck alloc] init];
//        [pcdeck checkDeck];
        _game = [[TwoCardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:pcdeck];
    }
    return _game;
}

- (void)updateUI
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.totalScore];
    self.flipResult.text = [self.game flipResults];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.game.flipCount];
}

- (IBAction)changeGameType:(id)sender {
    [self newGame:sender];
}






@end