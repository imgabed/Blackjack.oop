//
//  Card.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithSuit:(SuitType)suit cardValue:(int)value cardType:(CardType)type {
    self = [super init];
    if (self) {
        _suit = suit;
        _value = value;
        _type = type;
        _isFlipped = FALSE;
        
        if (type == CardTypeAce)
        {
            _isSoft = TRUE;
        }
    }
    return self;
}

@end
