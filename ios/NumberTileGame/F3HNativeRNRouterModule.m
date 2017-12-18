//
//  F3HNativeRNRouterModule.m
//  NumberTileGame
//
//  Created by Ashoka on 18/12/2017.
//

#import "F3HNativeRNRouterModule.h"
#import "F3HNumberTileGameViewController.h"
#import <React/RCTUtils.h>

@implementation F3HNativeRNRouterModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(jumpTo:(NSString *)name completion:(RCTResponseSenderBlock)callback)
{
    if ([name isEqualToString:@"game"]) {
        // arg 为要传给js的参数
        NSArray *events = @[@"1", @"2"];
        dispatch_async(dispatch_get_main_queue(), ^{
            F3HNumberTileGameViewController *vc = [F3HNumberTileGameViewController numberTileGameWithDimension:4
                                                                                                  winThreshold:2048
                                                                                               backgroundColor:[UIColor whiteColor]
                                                                                                   scoreModule:YES
                                                                                                buttonControls:NO
                                                                                                 swipeControls:YES];
            [(UINavigationController *)UIApplication.sharedApplication.keyWindow.rootViewController pushViewController:vc animated:NO];
            callback(@[[NSNull null], events]);
//            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
//                callback(@[[NSNull null], events]);
//            }];
        });
    }
    
}

@end
