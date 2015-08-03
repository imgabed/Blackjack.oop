//
//  Hand.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Hand.h"

@implementation Hand

- (id)init {
    self = [super init];
    if (self) {
        _lowestValue = 0;
        _highestValue = 0;
        _isSoft = NO;
        _cards = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addCard:(Card *)card {
    [_cards addObject:card];
}

- (void) printHand {
    for (Card *card in _cards)
    {
        [card printCard];
    }
}

@end
