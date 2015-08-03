//
//  Deck.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong, nonatomic) NSMutableArray *cards;
@property (assign, nonatomic) int numTimesPlayed;

@end

@implementation Deck

- (id)init {
    self = [super init];
    if (self) {
        [self initializeNewDeck];
    }
    return self;
}

- (void) initializeNewDeck {
    _cards = [[NSMutableArray alloc] init];
    
    [self addCardsWithSuit:SuitTypeDiamonds];
    [self addCardsWithSuit:SuitTypeClubs];
    [self addCardsWithSuit:SuitTypeHearts];
    [self addCardsWithSuit:SuitTypeSpades];
    [self printCurrentDeck];
}

- (void) addCardsWithSuit:(SuitType) suit {
    //Add numeric cards
    for (int i = 2; i <= 10; i++) {
        [_cards addObject:[[Card alloc] initWithSuit:suit cardValue:i cardType:CardTypeNumber]];
    }
    
    //Add face cards and Ace
    [_cards addObject:[[Card alloc] initWithSuit:suit cardValue:1 cardType:CardTypeAce]];
    [_cards addObject:[[Card alloc] initWithSuit:suit cardValue:10 cardType:CardTypeJack]];
    [_cards addObject:[[Card alloc] initWithSuit:suit cardValue:10 cardType:CardTypeQueen]];
    [_cards addObject:[[Card alloc] initWithSuit:suit cardValue:10 cardType:CardTypeKing]];
}

- (void) printCurrentDeck {
    for (Card *card in _cards) {
        printf("%s\n", [card.cardName UTF8String]);
    }
}

@end
