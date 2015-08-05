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
        _isFlipped = NO;
        _cardName = [NSString stringWithFormat:@"%@ of %@", [self formatCardTypeToString], [self formatSuitTypeToString]];
        
        if (type == CardTypeAce)
        {
            _isSoft = YES;
        }
    }
    return self;
}

- (NSString*)formatSuitTypeToString {
    NSString *suitString = nil;
    
    switch(_suit) {
        case SuitTypeDiamonds:
            suitString = @"Diamonds";
            break;
        case SuitTypeClubs:
            suitString = @"Clubs";
            break;
        case SuitTypeHearts:
            suitString = @"Hearts";
            break;
        case SuitTypeSpades:
            suitString = @"Spades";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected suit format type."];
    }
    return suitString;
}

- (NSString*)formatCardTypeToString {
    NSString *cardString = nil;
    
    switch(_type) {
        case CardTypeAce:
            cardString = @"Ace";
            break;
        case CardTypeJack:
            cardString = @"Jack";
            break;
        case CardTypeQueen:
            cardString = @"Queen";
            break;
        case CardTypeKing:
            cardString = @"King";
            break;
        case CardTypeNumber:
            cardString = [NSString stringWithFormat:@"%i", _value];
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected card format type."];
    }
    return cardString;
}

- (void)printCard:(BOOL)showHiddenCard {
    if(_isFlipped) {
        printf("[%s]\n", [_cardName UTF8String]);
    }
    else{
        if (showHiddenCard) {
            printf("[%s] (Hidden card)\n", [_cardName UTF8String]);
        }
        else {
            printf("[Hidden card]\n");
        }
    }
}

@end
