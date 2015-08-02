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

@interface Round : NSObject

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) Dealer *dealer;
@property (assign, nonatomic) int number;

- (void) start;

@end
