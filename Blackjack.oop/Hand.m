//
//  Hand.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Hand.h"

@interface Hand ()

@property (strong) NSMutableArray *cards;

@end

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
    if (card.isSoft) {
        _isSoft = YES;
        _highestValue += 11;
    }
    else {
        _highestValue += card.value;
    }
    _lowestValue += card.value;
    
    [_cards addObject:card];
}

- (void)printHand:(BOOL)showHiddenCard showBusted:(BOOL)showBusted{
    for (Card *card in _cards)
    {
        [card printCard:showHiddenCard];
    }
    
    if (self.isBusted && showBusted) {
        printf("***BUSTED***\n");
    }
}

- (BOOL)isBusted {
    return _lowestValue > 21;
}

- (int)highestUnbustedValue {
    if ([self isBusted]) {
        return -1;
    }
    else if (_highestValue <= 21) {
        return _highestValue;
    }
    else {
        return _lowestValue;
    }
}

@end
