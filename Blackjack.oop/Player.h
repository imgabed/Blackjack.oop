//
//  Player.h
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hand.h"

@interface Player : NSObject

@property (readonly, strong) NSString *name;
@property (readonly, strong) Hand *hand;
@property (readonly) double winningPercentage;

- (id)initWithName:(NSString *)name;
- (void)setHand:(Hand *)hand;

@end
