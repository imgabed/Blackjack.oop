//
//  Card.h
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SuitTypeDiamonds = 0,
    SuitTypeClubs,
    SuitTypeHearts,
    SuitTypeSpades
} SuitType;

typedef enum {
    CardTypeNumber = 0,
    CardTypeJack,
    CardTypeQueen,
    CardTypeKing,
    CardTypeAce
} CardType;

@interface Card : NSObject

@property (assign, nonatomic) int value;
@property (assign, nonatomic) BOOL isSoft;
@property (assign, nonatomic) BOOL isFlipped;
@property (assign, nonatomic) CardType type;
@property (assign, nonatomic) SuitType suit;


@end
