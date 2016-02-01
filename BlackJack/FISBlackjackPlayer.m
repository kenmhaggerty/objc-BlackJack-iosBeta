//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Ken M. Haggerty on 2/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

- (instancetype)init {
    
    self = [self initWithName:@""];
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    if (self) {
        _name = name;
        _cardsInHand = [NSMutableArray array];
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
        _handscore = 0;
        _wins = 0;
        _losses = 0;
    }
    return self;
}

- (void)resetForNewGame {
    
    //
}

- (void)acceptCard:(FISCard *)card {
    
    //
}

- (BOOL)shouldHit {
    
    return NO;
}

@end
