# Blackjack.oop
Blackjack in Objective-c

Game Logic:

Dealer:
-must hit on a soft 17
-must hit on a hard 16
-must stand on a hard 17
-must stand on any hands > 17

Determining Winner:
-dealer automatically wins if player's hand is busted, and dealer does not have to reveal his hidden card
-player wins if not busted and hand is greater than dealer or if dealer's hand is busted
-dealer wins if hand is greater than player's
-tie if both dealer and player have the same value at hand
