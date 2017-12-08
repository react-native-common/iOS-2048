//
//  F3HViewController.m
//  NumberTileGame
//
//  Created by Austin Zheng on 3/22/14.
//
//

#import "F3HViewController.h"
#import "F3HAppDelegate.h"

#import "F3HNumberTileGameViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>

@interface F3HViewController ()
@property (weak, nonatomic) RCTBridge *rnBridge;
@end

@implementation F3HViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rnBridge = [(F3HAppDelegate*)([UIApplication sharedApplication].delegate) rnBridge];
}

- (IBAction)playGameButtonTapped:(id)sender {
    F3HNumberTileGameViewController *c = [F3HNumberTileGameViewController numberTileGameWithDimension:4
                                                                                         winThreshold:2048
                                                                                      backgroundColor:[UIColor whiteColor]
                                                                                          scoreModule:YES
                                                                                       buttonControls:NO
                                                                                        swipeControls:YES];
    [self.navigationController pushViewController:c animated:YES];
}

- (IBAction)goToHighScores:(UIButton *)sender {
    NSLog(@"High Score Button Pressed");
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
//    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
//                                moduleName: @"RNHighScores"
//                         initialProperties:nil
//                             launchOptions: nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:_rnBridge
                             moduleName:@"RNHighScores"
                            initialProperties:@{
                                  @"scores" : @[
                                          @{
                                              @"name" : @"Alex",
                                              @"value": @"42"
                                              },
                                          @{
                                              @"name" : @"Joel",
                                              @"value": @"10"
                                              }
                                          ]
                                  }
                             ];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goToAbout:(UIButton *)sender {
    NSLog(@"About Button Pressed");
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:_rnBridge
                                                     moduleName:@"About"
                                              initialProperties:nil
                             ];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
