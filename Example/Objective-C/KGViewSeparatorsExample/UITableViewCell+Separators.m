//
//  UITableViewCell+Separators.m
//  KGViewSeparators
//
//  Created by Krisjanis Gaidis on 12/27/15.
//  Copyright © 2015 KG. All rights reserved.
//

#import "UITableViewCell+Separators.h"
#import "UITableViewCell+KGViewSeparators.h"

@implementation UITableViewCell (Separators)

- (void)showRedTopSeparator:(BOOL)show {
    [self kg_showTopSeparator:show color:[UIColor redColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
}

- (void)showRedBottomSeparator:(BOOL)show {
    [self kg_showBottomSeparator:show color:[UIColor redColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
}

- (void)showGreenTopSeparator:(BOOL)show {
    [self kg_showTopSeparator:show color:[UIColor greenColor] lineWidth:(1.0 / [UIScreen mainScreen].scale) insets:UIEdgeInsetsMake(0, 15, 0, 15)];
}

- (void)showGreenBottomSeparator:(BOOL)show {
    [self kg_showBottomSeparator:show color:[UIColor greenColor] lineWidth:(1.0 / [UIScreen mainScreen].scale) insets:UIEdgeInsetsMake(0, 15, 0, 15)];
}

- (void)showBlackTopSeparator:(BOOL)show {
    [self kg_showTopSeparator:show color:[UIColor blackColor] lineWidth:2.0 insets:UIEdgeInsetsMake(0, 0, 0, 40)];
}

- (void)showBlackBottomSeparator:(BOOL)show {
    [self kg_showBottomSeparator:show color:[UIColor blackColor] lineWidth:2.0 insets:UIEdgeInsetsMake(0, 0, 0, 40)];
}

@end