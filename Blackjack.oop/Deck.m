//
//  Deck.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Deck.h"

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

//Shuffling method taken from: http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
- (void)shuffle
{
    NSUInteger count = [_cards count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [_cards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

- (Card *)pop {
    if ([_cards count] == 0) {
        printf("Error: There are no more cards left in the deck\n");
        return nil;
    }
    Card *card = [_cards objectAtIndex:0];
    [_cards removeObjectAtIndex:0];
    return card;
}



@end
