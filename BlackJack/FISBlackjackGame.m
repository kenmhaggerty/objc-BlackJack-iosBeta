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
    
    self = [self initWithPlayers:@[[[FISBlackjackPlayer alloc] initWithName:@"Player"]] numberOfDecks:1];
    return self;
}

- (instancetype)initWithPlayers:(NSArray *)players numberOfDecks:(NSUInteger)numberOfDecks {
    
    self = [super init];
    if (self) {
        _deck = [[FISCardDeck alloc] initWithNumberOfDecks:numberOfDecks];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _players = players;
    }
    return self;
}

- (void)playBlackjack {
    
    [self.deck resetDeck];
    [self.house resetForNewGame];
    for (FISBlackjackPlayer *player in self.players) {
        [player resetForNewGame];
    }
    [self dealNewRound];
    int i = 0;
    NSUInteger numberOfBustedPlayers;
    FISBlackjackPlayer *player;
    while (i < 3) {
        numberOfBustedPlayers = 0;
        for (int j = 0; j < self.players.count; j++) {
            player = [self.players objectAtIndex:j];
            [self processTurnForPlayer:player];
            numberOfBustedPlayers += player.busted;
        }
        if (numberOfBustedPlayers == self.players.count) break;
        
        [self processTurnForPlayer:self.house];
        if (self.house.busted) break;
        i++;
    }
    [self incrementWinsAndLossesForWinningPlayers:[self winningPlayers]];
    for (int i = 0; i < self.players.count; i++) {
        NSLog(@"%@", [self.players objectAtIndex:i].description);
    }
    NSLog(@"%@", self.house.description);
}

- (void)dealNewRound {
    
    for (int i = 0; i < 2; i++) {
        for (FISBlackjackPlayer *player in self.players) {
            [self dealCardToPlayer:player];
        }
        [self dealCardToPlayer:self.house];
    }
}

//- (void)dealCardToPlayer {
//    
//    [self.player acceptCard:[self.deck drawNextCard]];
//}
//
//- (void)dealCardToHouse {
//    
//    [self.house acceptCard:[self.deck drawNextCard]];
//}

- (void)dealCardToPlayer:(FISBlackjackPlayer *)player {
    
    [player acceptCard:[self.deck drawNextCard]];
}

//- (void)processPlayerTurn {
//    
//    if (self.player.stayed || ![self.player shouldHit] || self.player.busted) return;
//    
//    [self dealCardToPlayer];
//}
//
//- (void)processHouseTurn {
//    
//    if (self.house.stayed || ![self.house shouldHit] || self.house.busted) return;
//    
//    [self dealCardToHouse];
//}

- (void)processTurnForPlayer:(FISBlackjackPlayer *)player {
    
    if (player.stayed || ![player shouldHit] || player.busted) return;
    
    [self dealCardToPlayer:player];
}

//- (BOOL)houseWins {
//    
//    if (self.house.busted) return NO;
//    
//    if (self.player.busted) return YES;
//    
//    if (self.house.blackjack && self.player.blackjack) return NO;
//    
//    return (self.house.handscore >= self.player.handscore);
//}

- (NSArray *)winningPlayers {
    
    NSMutableArray *winningPlayers = [NSMutableArray arrayWithCapacity:self.players.count];
    FISBlackjackPlayer *player;
    for (int i = 0; i < self.players.count; i++) {
        player = [self.players objectAtIndex:i];
        if (self.house.busted) [winningPlayers addObject:player];
        else if (player.busted) [winningPlayers addObject:self.house];
        else if (self.house.blackjack && player.blackjack) [winningPlayers addObject:[NSNull null]];
        else if (self.house.handscore >= player.handscore) [winningPlayers addObject:self.house];
        else [winningPlayers addObject:player];
    }
    return winningPlayers;
}

//- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
//    
//    NSLog(@"The house %@!", houseWins ? @"won" : @"lost");
//    self.house.wins += houseWins;
//    self.player.losses += houseWins;
//    self.house.losses += houseWins ? 0 : 1;
//    self.player.wins += houseWins ? 0 : 1;
//    NSLog(@"house = %lu wins, %lu losses", self.house.wins, self.house.losses);
//    NSLog(@"player = %lu wins, %lu losses", self.player.wins, self.player.losses);
//}

- (void)incrementWinsAndLossesForWinningPlayers:(NSArray <FISBlackjackPlayer *> *)winningPlayers {
    
    id winner;
    FISBlackjackPlayer *player;
    BOOL houseWins;
    for (int i = 0; i < winningPlayers.count; i++) {
        winner = [winningPlayers objectAtIndex:i];
        player = [self.players objectAtIndex:i];
        if (![winner isKindOfClass:[FISBlackjackPlayer class]]) {
            NSLog(@"House v. Player (%@) = PUSH", player.name);
        }
        else {
            NSLog(@"House v. Player (%@) = %@ WINS", player.name, ((FISBlackjackPlayer *)winner).name.uppercaseString);
            houseWins = [winner isEqual:self.house];
            self.house.wins += houseWins;
            player.losses += houseWins;
            self.house.losses += houseWins ? 0 : 1;
            player.wins += houseWins ? 0 : 1;
        }
        NSLog(@"House = %lu wins, %lu losses", self.house.wins, self.house.losses);
        NSLog(@"Player (%@) = %lu wins, %lu losses", player.name, player.wins, player.losses);
    }
}

@end
