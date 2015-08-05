//
//  Dealer.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Dealer.h"

@implementation Dealer

- (BOOL)shouldHit {
    if (self.hand.isSoft) {
        return self.hand.highestValue <= 17;
    }
    return self.hand.lowestValue < 17;
}

@end
