//
//  GameController.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/3/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "GameController.h"

@interface GameController ()
    @property int currentRoundNumber;
    @property (strong) Player *player;
    @property (strong) Dealer *dealer;
    @property (strong) Deck *deck;
@end

@implementation GameController

- (id)init {
    self = [super init];
    if (self) {
        _currentRoundNumber = 0;
        _player = [[Player alloc] initWithName:[self getPlayerName]];
        _dealer = [[Dealer alloc] initWithName:@"Dealer"];
        _deck = [[Deck alloc] init];
    }
    return self;
}

- (void)start {
    while (YES) {
        RoundController *round = [[RoundController alloc] initWithPlayer:_player dealer:_dealer deck:_deck roundNumber:_currentRoundNumber];
        [round start];
        
        if ([self shouldStartNewRound] == NO) {
            printf("\nQuiting command line blackjack...\n");
            return;
        }
        _currentRoundNumber++;
    }
}

- (BOOL)shouldStartNewRound {
    while (YES) {
        printf("\nStart a new round (y/n)? ");
        NSString *userAction = [self getUserInput];
        
        if ([userAction caseInsensitiveCompare:@"y"] == 0) {
            return YES;
        }
        else if ([userAction caseInsensitiveCompare:@"n"] == 0) {
            return NO;
        }
        else {
            printf("\nInvalid input. Please use (y/n).\n");
        }
    }
}

- (NSString*)getUserInput {
    char userInput[100];
    scanf("%s", userInput);
    
    return [NSString stringWithCString: userInput encoding: NSASCIIStringEncoding];
}

- (NSString*)getPlayerName {
    printf("Welcome to command line blackjack!\n");
    printf("Please enter your name: ");
    
    //Get player's name
    return [self getUserInput];
}

@end
