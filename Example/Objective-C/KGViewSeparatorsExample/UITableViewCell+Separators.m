//
//  UITableViewCell+Separators.m
//  KGViewSeparators
//
//  Created by Krisjanis Gaidis on 12/27/15.
//  Copyright © 2015 KG. All rights reserved.
//

#import "UITableViewCell+Separators.h"
#import "UIView+KGViewSeparators.h"
#import "KGViewSeparatorConfiguration+Defaults.h"

@implementation UITableViewCell (Separators)

- (void)showRedTopSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorTop color:[UIColor redColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
}

- (void)showRedBottomSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorBottom color:[UIColor redColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
}

- (void)showGreenTopSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorTop color:[UIColor greenColor] lineWidth:[KGViewSeparatorConfiguration defaultLineWidth] insets:UIEdgeInsetsMake(0, 15, 0, 15)];
}

- (void)showGreenBottomSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorBottom color:[UIColor greenColor] lineWidth:[KGViewSeparatorConfiguration defaultLineWidth] insets:UIEdgeInsetsMake(0, 15, 0, 15)];
}

- (void)showBlackTopSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorTop color:[UIColor blackColor] lineWidth:2.0 insets:UIEdgeInsetsMake(0, 0, 0, 40)];
}

- (void)showBlackBottomSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorBottom color:[UIColor blackColor] lineWidth:2.0 insets:UIEdgeInsetsMake(0, 0, 0, 40)];
}

@end