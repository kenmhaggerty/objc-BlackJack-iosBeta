//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Ken M. Haggerty on 2/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _deck = [[FISCardDeck alloc] init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
    }
    return self;
}

- (void)playBlackjack {
    
    //
}

- (void)dealNewRound {
    
    //
}

- (void)dealCardToPlayer {
    
    [self.player acceptCard:[self.deck drawNextCard]];
}

- (void)dealCardToHouse {
    
    [self.house acceptCard:[self.deck drawNextCard]];
}

- (void)processPlayerTurn {
    
    //
}

- (void)processHouseTurn {
    
    //
}

- (BOOL)houseWins {
    
    return NO;
}

- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
    
    //
}

@end
