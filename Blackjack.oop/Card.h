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

@property (readonly) int value;
@property (readonly) BOOL isSoft;
@property BOOL isFlipped;
@property (readonly, strong) NSString *cardName;
@property (readonly, assign) CardType type;
@property (readonly, assign) SuitType suit;

- (id)initWithSuit:(SuitType)suit cardValue:(int)value cardType:(CardType)type;
- (void)printCard:(BOOL)showHiddenCard;

@end
