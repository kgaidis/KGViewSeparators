//
//  UITableViewCell+KGViewSeparators.m
//  KGViewSeparators
//
//  Created by Krisjanis Gaidis on 12/27/15.
//  Copyright © 2015 KG. All rights reserved.
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#import "UITableViewCell+KGViewSeparators.h"
#import "UIView+KGViewSeparators.h"

@implementation UITableViewCell (KGViewSeparators)

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color  {
    [self.contentView kg_showTopSeparator:show color:color];
}

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    [self.contentView kg_showTopSeparator:show color:color lineWidth:lineWidth];
}

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets {
    [self.contentView kg_showTopSeparator:show color:color lineWidth:lineWidth insets:insets];
}

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color  {
    [self.contentView kg_showBottomSeparator:show color:color];
}

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    [self.contentView kg_showBottomSeparator:show color:color lineWidth:lineWidth];
}

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets {
    [self.contentView kg_showBottomSeparator:show color:color lineWidth:lineWidth insets:insets];
}

@end