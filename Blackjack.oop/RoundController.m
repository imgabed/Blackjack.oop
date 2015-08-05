//
//  Round.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "RoundController.h"

@interface RoundController ()

@property (assign) Player *player;
@property (assign) Dealer *dealer;
@property (assign) Player *winner;
@property (assign) Deck *deck;
@property int roundNumber;

@end

@implementation RoundController

- (id)initWithPlayer:(Player *)player dealer:(Dealer *)dealer deck:(Deck *)deck roundNumber:(int)roundNumber {
    self = [super init];
    if (self) {
        _player = player;
        _dealer = dealer;
        _deck = deck;
        _roundNumber = roundNumber;
    }
    return self;
}

- (void)start {
    printf("\n==============Starting Round #%d==============\n", self.roundNumber);
    printf("Player: %s\n", [self.player.name UTF8String]);
    
    [self shuffleDeckIfNeeded];
    [self dealCards];
    [self drawCards];
    [self determineWinnerOfRound];
    [self printRoundResults];
}

- (void)dealCards {
    printf("\n-----Dealing cards-----\n");
    
    [_player setHand:[[Hand alloc]init]];
    [_dealer setHand:[[Hand alloc]init]];
    
    [self drawCardToHand:_player.hand isFlipped:NO];
    [self drawCardToHand:_dealer.hand isFlipped:NO];
    [self drawCardToHand:_player.hand isFlipped:YES];
    [self drawCardToHand:_dealer.hand isFlipped:YES];
    
    [self printHandOfPlayer:_player showCard:YES showBusted:NO];
    [self printHandOfPlayer:_dealer showCard:NO showBusted:NO];
}

- (void)shuffleDeckIfNeeded {
    //shuffle deck every 6 rounds
    if (_roundNumber%6 == 0) {
        [_deck shuffle];
    }
}

- (void)drawCards {
    BOOL isPlayerActive = YES;
    BOOL isDealerActive = YES;

    while (YES) {
        printf("\n-----Drawing cards-----\n");
        
        //Only ask player to hit or stand if player has not decided already decided to stand
        if (isPlayerActive) {
            isPlayerActive = [self drawCardForPlayer:_player showHiddenCard:YES];
        }
        [self printHandOfPlayer:_player showCard:YES showBusted:NO];

        if (isDealerActive) {
            isDealerActive = [self drawCardForPlayer:_dealer showHiddenCard:NO];
        }
        [self printHandOfPlayer:_dealer showCard:NO showBusted:NO];

        //if both dealer and player chose to stand, stop drawing cards
        if ((isDealerActive == NO) && (isPlayerActive == NO)) {
            return;
        }
        
        printf("\nPress Enter to Continue");
        [self getEnterFromUser];
    }
}

- (BOOL)drawCardForPlayer:(Player *)player showHiddenCard:(BOOL)showCard{
    BOOL playerShouldHit = [player shouldHit];
    
    if (playerShouldHit) {
        printf("\n%s chose to hit.\n", [player.name UTF8String]);
        [self drawCardToHand:player.hand isFlipped:YES];
    }
    else {
        printf("\n%s chose to stand.\n", [player.name UTF8String]);
    }
    return playerShouldHit;
}

- (void)getEnterFromUser {
    while (getchar() != '\n');
}

- (void)determineWinnerOfRound {
    printf("\nPress Enter to reveal cards");
    [self getEnterFromUser];
    
    printf("\n-----Revealing cards-----\n");
    [self printHandOfPlayer:_player showCard:YES showBusted:YES];
    
    if ([_player.hand isBusted]) {
        [self printHandOfPlayer:_dealer showCard:NO showBusted:NO];
        [self setWinner:_dealer loser:_player];
        return;
    }
    [self printHandOfPlayer:_dealer showCard:YES showBusted:YES];
    
    if ([_dealer.hand isBusted]) {
        [self setWinner:_player loser:_dealer];
    }
    else if (_dealer.hand.bestValue > _player.hand.bestValue) {
        [self setWinner:_dealer loser:_player];
    }
    else if (_dealer.hand.bestValue < _player.hand.bestValue){
        [self setWinner:_player loser:_dealer];
    }
    else { //draw
        [self setDraw];
    }
}

- (void)setDraw {
    [_dealer updateStatsDidWin:NO];
    [_player updateStatsDidWin:NO];
}

- (void)setWinner:(Player *)winner loser:(Player *)loser {
    _winner = winner;
    [loser updateStatsDidWin:NO];
    [winner updateStatsDidWin:YES];
}

- (void)printRoundResults {
    printf("\n--------Results--------\n");
    
    if (_winner != nil) {
        printf("\n%s is the winner of Round #%d!\n", [_winner.name UTF8String], _roundNumber);
    }
    else {
        printf("\nRound #%d is a draw!\n", _roundNumber);
    }
    printf("\nWinning percentage of %s: %.1f%%\n", [_player.name UTF8String], _player.winningPercentage);
    printf("Winning percentage of %s: %.1f%%\n", [_dealer.name UTF8String], _dealer.winningPercentage);
    
}

- (void)printHandOfPlayer:(Player *)player showCard:(BOOL)showHiddenCard showBusted:(BOOL)showBusted{
    printf("\n%s's hand:\n", [player.name UTF8String]);
    [player.hand printHand:showHiddenCard showBusted:showBusted];
}

- (void)drawCardToHand:(Hand *)hand isFlipped:(BOOL)isFlippedCard{
    Card *card = [_deck pop];
    
    if (isFlippedCard) {
        card.isFlipped = YES;
    }
    [hand addCard:card];
}

@end
