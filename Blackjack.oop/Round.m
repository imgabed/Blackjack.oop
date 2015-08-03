//
//  Round.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Round.h"


@implementation Round

- (id)init {
    self = [super init];
    if (self) {
        _player = [[Player alloc]init];
        _dealer = [[Dealer alloc]init];
    }
    return self;
}

- (void) start {
    printf("Starting Round #%d\n", self.number);
    printf("Player: %s\n", [self.player.name UTF8String]);
    Deck *deck = [[Deck alloc] init];
    
}
@end
