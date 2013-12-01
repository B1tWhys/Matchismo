//
//  SetGameViewController.m
//  Matchismo
//
//  Created by David Leserman on 6/5/13.
//  Copyright (c) 2013 Skyler Arnold. All rights reserved.
//

#import "SetGameViewController.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController
/*
we need a setGame class, which will do the logic for a set game here, we will put the initiator in the view did load method. While this is different from the CardGameViewControler, i think it is right, because there, we basicly turned the setter into the initializer, instead of just initilizing the object right when matchismo loads
*/

+(NSString *)getCardString:(SetCard *)card
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
