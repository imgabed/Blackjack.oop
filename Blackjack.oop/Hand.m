//
//  Hand.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Hand.h"

@interface Hand ()

@property int numAces;
@property int visibleValue;
@property (strong) NSMutableArray *cards;

@end

@implementation Hand

- (id)init {
    self = [super init];
    if (self) {
        _lowestValue = 0;
        _highestValue = 0;
        _numAces = 0;
        _isSoft = NO;
        _cards = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addCard:(Card *)card {
    if (card.isSoft) {
        _isSoft = YES;
        _numAces++;
        _highestValue += 11;
    }
    else {
        _highestValue += card.value;
    }
    _lowestValue += card.value;
    
    if (card.isFlipped) {
        _visibleValue += card.value;
    }
    [_cards addObject:card];
}

- (void)printHand:(BOOL)showHiddenCard showBusted:(BOOL)showBusted{
    for (Card *card in _cards)
    {
        [card printCard:showHiddenCard];
    }
    
    if ((self.isBusted && showBusted) || self.isVisiblyBusted) {
        printf("***BUSTED***\n");
    }
    
    if (showHiddenCard) {
        printf("Value: %d\n", self.bestValue);
    }
}

- (BOOL)isBusted {
    return _lowestValue > 21;
}

- (BOOL)isVisiblyBusted {
    return _visibleValue >= 21;
}

- (int)bestValue {
    if (_isSoft) {
        return [self getBestValueWithAces];
    }
    return _lowestValue;
}

- (int)getBestValueWithAces {
    int bestValue = _lowestValue;
    for (int i = 0; i < _numAces; i++)
    {
        if (bestValue + 10 > 21) {
            break;
        }
        bestValue += 10;
    }
    return bestValue;
}

@end
