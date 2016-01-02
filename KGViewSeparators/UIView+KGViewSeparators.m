//
//  UIView+KGViewSeparators.m
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

#import "UIView+KGViewSeparators.h"
#import <objc/runtime.h>
#import "KGViewSeparatorConfiguration+Defaults.h"

// Associated Objects
static char kKGMapTableKey;
static char kKGDictionaryKey;

// ViewAndConstraintMapTable
static NSString *const kKGTopSeparatorViewKey = @"TopSeparatorView";
static NSString *const kKGBottomSeparatorViewKey = @"BottomSeparatorView";

// ConfigurationDictionary
static NSString *const kKGTopSeparatorConfigurationKey = @"TopSeparatorConfigurationKey";
static NSString *const kKGBottomSeparatorConfigurationKey = @"BottomSeparatorConfigurationKey";

// Constraint Dictionary
static NSString *const kKGViewKey = @"ViewKey";

@implementation UIView (KGViewSeparators)

#pragma mark - Main Public Methods -

- (void)kg_showTopSeparator:(BOOL)show configuration:(KGViewSeparatorConfiguration *)configuration {
    if (show) {
        NSAssert(configuration, @"For a separator view to be shown correctly, a configuration must be provided.");
    }
    
    UIView *topSeparator = [self kg_topSeparatorView];
    if (show && !topSeparator) {
        topSeparator = [self kg_createAndInsertSeparatorView];
        [self kg_setTopSeparatorView:topSeparator];
    }
    
    KGViewSeparatorConfiguration *oldConfiguration = [self kg_topSeparatorConfiguration];
    if (show && ![oldConfiguration isEqual:configuration]) {
        [self kg_removeAllConstraintsForSeparatorView:topSeparator];
        [self kg_addTopSeparatorViewConstraintsWithConfiguration:configuration];
        [self kg_configureView:topSeparator withConfiguration:configuration];
        [self kg_setTopSeparatorConfiguration:configuration];
    }
    
    topSeparator.hidden = !show;
}

- (void)kg_showBottomSeparator:(BOOL)show configuration:(KGViewSeparatorConfiguration *)configuration {
    if (show) {
        NSAssert(configuration, @"For a separator view to be shown correctly, a configuration must be provided.");
    }
    
    UIView *bottomSeparator = [self kg_bottomSeparatorView];
    if (show && !bottomSeparator) {
        bottomSeparator = [self kg_createAndInsertSeparatorView];
        [self kg_setBottomSeparatorView:bottomSeparator];
    }
    
    KGViewSeparatorConfiguration *oldConfiguration = [self kg_bottomSeparatorConfiguration];
    if (show && ![oldConfiguration isEqual:configuration]) {
        [self kg_removeAllConstraintsForSeparatorView:bottomSeparator];
        [self kg_addBottomSeparatorViewConstraintsWithConfiguration:configuration];
        [self kg_configureView:bottomSeparator withConfiguration:configuration];
        [self kg_setBottomSeparatorConfiguration:configuration];
    }
    
    bottomSeparator.hidden = !show;
}

#pragma mark - Public Helper Methods -

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color  {
    [self kg_showTopSeparator:show color:color lineWidth:[KGViewSeparatorConfiguration defaultLineWidth]];
}

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    [self kg_showTopSeparator:show color:color lineWidth:lineWidth insets:[KGViewSeparatorConfiguration defaultInsets]];
}

- (void)kg_showTopSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets {
    
    KGViewSeparatorConfiguration *configuration = nil;
    if (show) {
        configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:color lineWidth:lineWidth insets:insets];
    }
    
    [self kg_showTopSeparator:show configuration:configuration];
}

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color  {
    [self kg_showBottomSeparator:show color:color lineWidth:[KGViewSeparatorConfiguration defaultLineWidth]];
}

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    [self kg_showBottomSeparator:show color:color lineWidth:lineWidth insets:[KGViewSeparatorConfiguration defaultInsets]];
}

- (void)kg_showBottomSeparator:(BOOL)show color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets {
    
    KGViewSeparatorConfiguration *configuration = nil;
    if (show) {
        configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:color lineWidth:lineWidth insets:insets];
    }
    [self kg_showBottomSeparator:show configuration:configuration];
}

#pragma mark - Private -

- (UIView *)kg_createAndInsertSeparatorView {
    UIView *view = [UIView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self insertSubview:view atIndex:0];
    return view;
}

- (void)kg_configureView:(UIView *)view withConfiguration:(KGViewSeparatorConfiguration *)configuration {
    view.backgroundColor = configuration.color;
}

- (void)kg_addTopSeparatorViewConstraintsWithConfiguration:(KGViewSeparatorConfiguration *)configuration {
    UIView *topSeparatorView = [self kg_topSeparatorView];
    NSDictionary *viewDictionary = @{kKGViewKey: topSeparatorView};
    NSString *verticalVisualFormatString = [NSString stringWithFormat:@"V:|[%@(==%f)]", kKGViewKey, configuration.lineWidth];
    NSString *horizontalVisualFormatString = [NSString stringWithFormat:@"H:|-%f-[%@]-%f-|", configuration.insets.left, kKGViewKey, configuration.insets.right];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormatString options:0 metrics:nil views:viewDictionary];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalVisualFormatString options:0 metrics:nil views:viewDictionary];
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
}

- (void)kg_addBottomSeparatorViewConstraintsWithConfiguration:(KGViewSeparatorConfiguration *)configuration {
    UIView *bottomSeparatorView = [self kg_bottomSeparatorView];
    NSDictionary *viewDictionary = @{kKGViewKey: bottomSeparatorView};
    NSString *verticalVisualFormatString = [NSString stringWithFormat:@"V:[%@(==%f)]|", kKGViewKey, configuration.lineWidth];
    NSString *horizontalVisualFormatString = [NSString stringWithFormat:@"H:|-%f-[%@]-%f-|", configuration.insets.left, kKGViewKey, configuration.insets.right];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormatString options:0 metrics:nil views:viewDictionary];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalVisualFormatString options:0 metrics:nil views:viewDictionary];
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
}

- (void)kg_removeAllConstraintsForSeparatorView:(UIView *)separatorView {
    NSMutableArray *constraintsToRemove = [NSMutableArray new];
    for (NSLayoutConstraint *constraint in separatorView.superview.constraints) {
        if (constraint.firstItem == separatorView || constraint.secondItem == separatorView) {
            [constraintsToRemove addObject:constraint];
        }
    }
    [separatorView.superview removeConstraints:constraintsToRemove];
    [separatorView removeConstraints:separatorView.constraints];
}

#pragma mark - Map Table Getters -

- (UIView *)kg_topSeparatorView {
    return [[self kg_viewMapTable] objectForKey:kKGTopSeparatorViewKey];
}

- (UIView *)kg_bottomSeparatorView {
    return [[self kg_viewMapTable] objectForKey:kKGBottomSeparatorViewKey];
}

#pragma mark - Map Table Setters -

- (void)kg_setTopSeparatorView:(UIView *)topSeparator {
    [[self kg_viewMapTable] setObject:topSeparator forKey:kKGTopSeparatorViewKey];
}

- (void)kg_setBottomSeparatorView:(UIView *)bottomSeparator {
    [[self kg_viewMapTable] setObject:bottomSeparator forKey:kKGBottomSeparatorViewKey];
}

#pragma mark - Dictionary Getters -

// Saving configurations allows us to check whether the
// user passed in a new type of configuration. If it's a new
// type of configuration, then we need to reset the constraints.
// Otherwise, we don't do anything.

- (KGViewSeparatorConfiguration *)kg_topSeparatorConfiguration {
    return [[self kg_configurationDictionary] objectForKey:kKGTopSeparatorConfigurationKey];
}

- (KGViewSeparatorConfiguration *)kg_bottomSeparatorConfiguration {
    return [[self kg_configurationDictionary] objectForKey:kKGBottomSeparatorConfigurationKey];
}

#pragma mark - Dictionary Setters -

- (void)kg_setTopSeparatorConfiguration:(KGViewSeparatorConfiguration *)configuration {
    [[self kg_configurationDictionary] setObject:configuration forKey:kKGTopSeparatorConfigurationKey];
}

- (void)kg_setBottomSeparatorConfiguration:(KGViewSeparatorConfiguration *)configuration {
    [[self kg_configurationDictionary] setObject:configuration forKey:kKGBottomSeparatorConfigurationKey];
}

#pragma mark - Associated Object Handling -

- (NSMapTable *)kg_viewMapTable {
    NSMapTable *mapTable = objc_getAssociatedObject(self, &kKGMapTableKey);
    if (!mapTable) {
        // The strong to weak mapping prevents retain cycles when we store
        // views and constraints
        mapTable = [NSMapTable strongToWeakObjectsMapTable];
        objc_setAssociatedObject(self, &kKGMapTableKey, mapTable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return mapTable;
}

- (NSMutableDictionary *)kg_configurationDictionary {
    NSMutableDictionary *configurationDictionary = objc_getAssociatedObject(self, &kKGDictionaryKey);
    if (!configurationDictionary) {
        configurationDictionary = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &kKGDictionaryKey, configurationDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return configurationDictionary;
}

@end