//
//  Round.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "RoundController.h"


@implementation RoundController

- (id)initWithPlayer:(Player *)player dealer:(Dealer *)dealer deck:(Deck *)deck {
    self = [super init];
    if (self) {
        _player = player;
        _dealer = dealer;
        _deck = deck;
    }
    return self;
}

- (void) start {
    printf("\nStarting Round #%d\n", self.number);
    printf("Player: %s\n", [self.player.name UTF8String]);
    [self dealCards];
    [self printHandOfPlayer:_player];
    [self printHandOfPlayer:_dealer];
}

- (void) dealCards {
    printf("\nDealing cards...\n");
    _player.hand = [[Hand alloc]init];
    _dealer.hand = [[Hand alloc]init];
    
    [self passCardToHand:_player.hand isFlipped:NO];
    [self passCardToHand:_dealer.hand isFlipped:NO];
    [self passCardToHand:_player.hand isFlipped:YES];
    [self passCardToHand:_dealer.hand isFlipped:YES];
}

- (void) printHandOfPlayer:(Player *)player {
    printf("\n%s's hand:\n", [player.name UTF8String]);
    [player.hand printHand];
}

- (void) passCardToHand:(Hand *)hand isFlipped:(BOOL)isFlippedCard{
    Card *card = [_deck pop];
    
    if (isFlippedCard) {
        card.isFlipped = YES;
    }
    [hand addCard:card];
}

@end
