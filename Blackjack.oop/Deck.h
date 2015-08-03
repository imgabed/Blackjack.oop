//
//  Deck.h
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;
@property (assign, nonatomic) int numTimesPlayed;

- (void)shuffle;
- (Card *)pop;

@end
