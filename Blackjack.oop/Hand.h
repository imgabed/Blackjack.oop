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

@property (assign, nonatomic) int lowestValue;
@property (assign, nonatomic) int highestValue;
@property (assign, nonatomic) BOOL isSoft;
@property (strong, nonatomic) NSMutableArray *cards;

- (void)addCard:(Card *)card;
- (void) printHand;

@end
