//
//  Dealer.h
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hand.h"

@interface Dealer : NSObject

@property (strong, nonatomic) const NSString *name;
@property (strong, nonatomic) Hand *hand;
@property (assign, nonatomic) double winningPercentage;

@end
