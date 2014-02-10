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
@property (nonatomic, strong) SetCardMatchingGame *game;
@end

@implementation SetGameViewController
/*
we need a setGame class, which will do the logic for a set game here, we will put the initiator in the view did load method. While this is different from the CardGameViewControler, i think it is right, because there, we basicly turned the setter into the initializer, instead of just initilizing the object right when matchismo loads
*/

 @synthesize game = _game;

- (SetCardMatchingGame *) game
{
    if (!_game) {
        SetCardDeck *scDeck = [[SetCardDeck alloc] init];
        //        [scDeck checkDeck];
        self.game = [[SetCardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:scDeck];
    }
    return self.game;
}

+ (NSString *)getCardString:(SetCard *)card
{
    NSString *placeHolderVariable = [[NSString alloc] init];
    return placeHolderVariable;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)setCard:(UIButton *)sender
{
    [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
    // we need to call [self updateUI]; from here when it is implemented
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)updateUI
{
    [super updateUI];
    // Compute and set the UI state for each cardButton.
    for (UIButton *cardButton in self.cardButtons) {
        SetCard *card = (SetCard *) [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        // get the count, shape, fill & color properties for the card and formulate
        // the attributed string for dispaly. TODO 2/15/14
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
