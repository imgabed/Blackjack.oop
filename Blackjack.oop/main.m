//
//  main.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoundController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Welcome to command line blackjack!\n");
        printf("Please enter your name: ");
        
        //Get player's name
        char userInput[100];
        scanf("%s", &userInput);
        
        //initialize player and dealer
        Player *player = [[Player alloc] init];
        Dealer *dealer = [[Dealer alloc] init];
        Deck *deck = [[Deck alloc] init];
        
        player.name = [NSString stringWithCString: userInput encoding: NSASCIIStringEncoding];
        dealer.name = @"Dealer";
        [deck shuffle];

        //Starting game
        int roundNumber = 0;
        while (YES) {
            RoundController *round = [[RoundController alloc] initWithPlayer:player dealer:dealer deck:deck];
            round.number = roundNumber;
            [round start];
            
            printf("\nStart a new round?");
            scanf("%s", &userInput);
            roundNumber++;
            
            //shuffle deck every 6 rounds
            if (roundNumber%6 == 0) {
                [deck shuffle];
            }
        }
    }
    return 0;
}
