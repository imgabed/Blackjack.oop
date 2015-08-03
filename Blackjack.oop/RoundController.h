//
//  Game.h
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dealer.h"
#import "Player.h"
#import "Deck.h"

@interface RoundController : NSObject

@property (assign, nonatomic) Player *player;
@property (assign, nonatomic) Dealer *dealer;
@property (assign, nonatomic) Deck *deck;
@property (assign, nonatomic) int number;

- (void) start;
- (id)initWithPlayer:(Player *)player dealer:(Dealer *)dealer deck:(Deck *)deck;

@end
