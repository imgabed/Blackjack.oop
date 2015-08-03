//
//  main.m
//  Blackjack.oop
//
//  Created by Bess Chan on 8/1/15.
//  Copyright © 2015 Bess Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Round.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Player *player = [[Player alloc] init];
        Dealer *dealer = [[Dealer alloc] init];
        
        printf("Welcome to command line blackjack!\n");
        printf("Please enter your name: ");
        
        char userInput[100];
        scanf("%s", &userInput);
        
        //initialize player and dealer
        player.name = [NSString stringWithCString: userInput encoding: NSASCIIStringEncoding];

        int roundNumber = 1;
        
        while (true) {
            Round *round = [[Round alloc] init];
            round.number = roundNumber;
            round.player = player;
            round.dealer = dealer;
            
            [round start];
            
            printf("Start a new round?");
            scanf("%s", &userInput);
            roundNumber++;
        }
    }
    return 0;
}
