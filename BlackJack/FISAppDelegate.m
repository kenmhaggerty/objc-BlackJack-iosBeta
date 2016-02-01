//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackGame.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *players = @[[[FISBlackjackPlayer alloc] initWithName:@"Ada"], [[FISBlackjackPlayer alloc] initWithName:@"Charles"]];
    FISBlackjackGame *game = [[FISBlackjackGame alloc] initWithPlayers:players numberOfDecks:3];
    [game playBlackjack];
    [game playBlackjack];
    [game playBlackjack];
    
    return YES;
}

@end
