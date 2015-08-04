//
//  Player.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Player.h"

@interface Player ()

@property int numTimesWon;
@property int numTimesPlayed;

@end

@implementation Player

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _numTimesPlayed = 0;
        _numTimesWon = 0;
    }
    return self;
}

- (void)setHand:(Hand *)hand {
    _hand = hand;
}

- (double)winningPercentage {
    if (_numTimesPlayed == 0) {
        return 0.0;
    }
    return (double)_numTimesWon/_numTimesPlayed;
}

@end
