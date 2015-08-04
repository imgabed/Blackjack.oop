//
//  Hand.h
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Hand : NSObject

@property (readonly) int lowestValue;
@property (readonly) int highestValue;
@property (readonly) BOOL isSoft;
@property (readonly) BOOL isBusted;
@property (readonly, strong) NSMutableArray *cards;

- (void)addCard:(Card *)card;
- (void)printHand;

@end
