//
//  UIView+KGViewSeparators.h
//  Krisjanis Gaidis
//
//  Created by Krisjanis Gaidis on 11/27/15.
//  Copyright (c) 2015 Krisjanis Gaidis. All rights reserved.
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

#import <UIKit/UIKit.h>
#import "KGViewSeparatorConfiguration.h"

@interface UIView (KGViewSeparators)

#pragma mark - Main Interface -

- (void)kg_showTopSeparator:(BOOL)show configuration:(KGViewSeparatorConfiguration *)configuration;
- (void)kg_showBottomSeparator:(BOOL)show configuration:(KGViewSeparatorConfiguration *)configuration;

- (KGViewSeparatorConfiguration *)kg_topSeparatorConfiguration;
- (KGViewSeparatorConfiguration *)kg_bottomSeparatorConfiguration;

#pragma mark - Helper Interface -

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color;
- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth;
- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets;

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color;
- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth;
- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets;

@end