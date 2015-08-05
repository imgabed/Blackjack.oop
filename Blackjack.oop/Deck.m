//
//  Deck.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong) NSMutableArray *unusedCards;
@property (strong) NSMutableArray *usedCards;

@end

@implementation Deck

- (id)init {
    self = [super init];
    if (self) {
        [self initializeNewDeck];
    }
    return self;
}

- (void)initializeNewDeck {
    _unusedCards = [[NSMutableArray alloc] init];
    _usedCards = [[NSMutableArray alloc] init];
    
    [self addCardsWithSuit:SuitTypeDiamonds];
    [self addCardsWithSuit:SuitTypeClubs];
    [self addCardsWithSuit:SuitTypeHearts];
    [self addCardsWithSuit:SuitTypeSpades];
}

- (void)addCardsWithSuit:(SuitType) suit {
    //Add numeric cards
    for (int i = 2; i <= 10; i++) {
        [_unusedCards addObject:[[Card alloc] initWithSuit:suit cardValue:i cardType:CardTypeNumber]];
    }
    
    //Add face cards and Ace
    [_unusedCards addObject:[[Card alloc] initWithSuit:suit cardValue:1 cardType:CardTypeAce]];
    [_unusedCards addObject:[[Card alloc] initWithSuit:suit cardValue:10 cardType:CardTypeJack]];
    [_unusedCards addObject:[[Card alloc] initWithSuit:suit cardValue:10 cardType:CardTypeQueen]];
    [_unusedCards addObject:[[Card alloc] initWithSuit:suit cardValue:10 cardType:CardTypeKing]];
}

- (void)printCurrentDeck {
    for (Card *card in _unusedCards) {
        printf("%s\n", [card.cardName UTF8String]);
    }
}

//Shuffling method taken from: http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
- (void)shuffle
{
    printf("\nShuffling cards...\n");
    [self gatherCards];
    NSUInteger count = [_unusedCards count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [_unusedCards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

- (void)gatherCards {
    [_unusedCards addObjectsFromArray:_usedCards];
    [_usedCards removeAllObjects];
}

- (Card *)pop {
    if ([_unusedCards count] == 0) {
        printf("Error: There are no more cards left in the deck\n");
        return nil;
    }
    Card *card = [_unusedCards objectAtIndex:0];
    [_unusedCards removeObjectAtIndex:0];
    [_usedCards addObject:card];
    return card;
}

@end
