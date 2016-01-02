//
//  UIView+Separator.m
//  KGViewSeparators
//
//  Created by Krisjanis Gaidis on 12/27/15.
//  Copyright © 2015 KG. All rights reserved.
//

#import "UITableViewCell+Separator.h"
#import "UIView+KGViewSeparators.h"

@implementation UITableViewCell(Separator)

- (void)showTopSeparator:(BOOL)show {
    KGViewSeparatorConfiguration *configuration = [self.contentView topSeparatorConfiguration];
    if (!configuration && show) {
        configuration = [KGViewSeparatorConfiguration new];
        configuration.color = [UIColor redColor];
        configuration.lineWidth = 0.5;
        configuration.insets = UIEdgeInsetsZero;
    }
    [self.contentView showTopSeparator:show configuration:configuration];
}

- (void)showBottomSeparator:(BOOL)show {
    KGViewSeparatorConfiguration *configuration = [self.contentView bottomSeparatorConfiguration];
    if (!configuration && show) {
        configuration = [KGViewSeparatorConfiguration new];
        configuration.color = [UIColor redColor];
        configuration.lineWidth = 0.5;
        configuration.insets = UIEdgeInsetsZero;
    }
    [self.contentView showBottomSeparator:show configuration:configuration];
}

@end