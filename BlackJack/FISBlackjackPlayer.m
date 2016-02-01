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
    
    [self.cardsInHand addObject:card];
    self.handscore = 0;
    for (FISCard *cardInHand in self.cardsInHand) {
        self.handscore += MIN(cardInHand.cardValue, 10);
    }
    if ([card.rank isEqualToString:@"A"]) self.aceInHand = YES;
    if (self.aceInHand && (self.handscore <= 11)) {
        self.handscore += 10;
    }
    if (self.handscore > 21) {
        self.busted = YES;
    }
    else if ((self.handscore == 21) && (self.cardsInHand.count == 2)) {
        self.blackjack = YES;
    }
}

- (BOOL)shouldHit {
    
    return NO;
}

@end
