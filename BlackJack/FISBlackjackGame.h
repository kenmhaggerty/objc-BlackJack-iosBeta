//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Ken M. Haggerty on 2/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"

@interface FISBlackjackGame : NSObject
@property (nonatomic, strong) FISCardDeck *deck;
@property (nonatomic, strong) FISBlackjackPlayer *house;
@property (nonatomic, strong) NSArray <FISBlackjackPlayer *> *players;
- (instancetype)initWithPlayers:(NSArray <FISBlackjackPlayer *> *)players numberOfDecks:(NSUInteger)numberOfDecks;
- (void)playBlackjack;
- (void)dealNewRound;
//- (void)dealCardToPlayer;
//- (void)dealCardToHouse;
- (void)dealCardToPlayer:(FISBlackjackPlayer *)player;
//- (void)processPlayerTurn;
//- (void)processHouseTurn;
- (void)processTurnForPlayer:(FISBlackjackPlayer *)player;
//- (BOOL)houseWins;
- (NSArray <FISBlackjackPlayer *> *)winningPlayers;
//- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins;
- (void)incrementWinsAndLossesForWinningPlayers:(NSArray <FISBlackjackPlayer *> *)winningPlayers;
@end
