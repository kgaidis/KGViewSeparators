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

CGFloat KGViewSeparatorLineWidth(CGFloat lineWidth) {
    return (lineWidth / [UIScreen mainScreen].scale);
}

// Associated Objects
static char kKGMapTableKey;
static char kKGDictionaryKey;

// Constraint Dictionary
static NSString *const kKGViewKey = @"ViewKey";

@implementation UIView (KGViewSeparators)

#pragma mark - Main Public Methods -

- (UIView *)kg_show:(BOOL)show separator:(KGViewSeparatorType)type configuration:(KGViewSeparatorConfiguration *)newConfiguration {
    if (show) {
        NSAssert(newConfiguration, @"For a separator view to be shown correctly, a configuration must be provided.");
    }
    
    UIView *separator = [self kg_separatorViewOfType:type];
    if (show && !separator) {
        separator = [self kg_createAndInsertSeparatorView];
        [self kg_setSeparatorView:separator ofType:type];
    }
    
    KGViewSeparatorConfiguration *oldConfiguration = [self kg_configurationForSeparatorOfType:type];
    if (show && ![oldConfiguration isEqual:newConfiguration]) {
        [self kg_removeAllConstraintsForSeparatorView:separator];
        [self kg_addViewConstraintsForSeparatorOfType:type withConfiguration:newConfiguration];
        [self kg_applyConfiguration:newConfiguration toView:separator];
        [self kg_setConfiguration:newConfiguration forSeparatorOfType:KGViewSeparatorTop];
    }
    
    separator.hidden = !show;
    
    return separator;
}

#pragma mark - Public Helper Methods -

- (UIView *)kg_show:(BOOL)show separator:(KGViewSeparatorType)type color:(UIColor *)color {
    return [self kg_show:show separator:type color:color lineWidth:[KGViewSeparatorConfiguration defaultLineWidth]];
}

- (UIView *)kg_show:(BOOL)show separator:(KGViewSeparatorType)type color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    return [self kg_show:show separator:type color:color lineWidth:lineWidth insets:[KGViewSeparatorConfiguration defaultInsets]];
}

- (UIView *)kg_show:(BOOL)show separator:(KGViewSeparatorType)type color:(UIColor *)color lineWidth:(CGFloat)lineWidth insets:(UIEdgeInsets)insets {
    
    KGViewSeparatorConfiguration *configuration = nil;
    if (show) {
        configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:color lineWidth:lineWidth insets:insets];
    }
    
    return [self kg_show:show separator:type configuration:configuration];
}

#pragma mark - Private -

- (UIView *)kg_createAndInsertSeparatorView {
    UIView *view = [UIView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self insertSubview:view atIndex:0];
    return view;
}

- (void)kg_applyConfiguration:(KGViewSeparatorConfiguration *)configuration toView:(UIView *)view
{
    view.backgroundColor = configuration.color;
}

- (void)kg_addViewConstraintsForSeparatorOfType:(KGViewSeparatorType)type withConfiguration:(KGViewSeparatorConfiguration *)configuration {
    
    UIView *separatorView = [self kg_separatorViewOfType:type];
    NSDictionary *viewDictionary = @{kKGViewKey: separatorView};
    NSString *verticalVisualFormatString = [NSString stringWithFormat:[self kg_verticalVisualFormatStringForSeparatorOfType:type], kKGViewKey, configuration.lineWidth];
    NSString *horizontalVisualFormatString = [NSString stringWithFormat:@"H:|-%f-[%@]-%f-|", configuration.insets.left, kKGViewKey, configuration.insets.right];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormatString options:0 metrics:nil views:viewDictionary];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalVisualFormatString options:0 metrics:nil views:viewDictionary];
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
}

- (NSString *)kg_verticalVisualFormatStringForSeparatorOfType:(KGViewSeparatorType)type {
    switch (type) {
        case KGViewSeparatorTop:
            return @"V:|[%@(==%f)]";
            break;
        case KGViewSeparatorBottom:
            return @"V:[%@(==%f)]|";
            break;
    }
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

#pragma mark - Key Generators -

- (NSString *)kg_separatorViewKeyOfType:(KGViewSeparatorType)type {
    return [NSString stringWithFormat:@"%lu_SeparatorView", (unsigned long)type];
}

#pragma mark - Map Table Accessors -

- (UIView *)kg_separatorViewOfType:(KGViewSeparatorType)type {
    return [[self kg_viewMapTable] objectForKey:[self kg_separatorViewKeyOfType:type]];
}

- (void)kg_setSeparatorView:(UIView *)separatorView ofType:(KGViewSeparatorType)type {
    [[self kg_viewMapTable] setObject:separatorView forKey:[self kg_separatorViewKeyOfType:type]];
}

#pragma mark - Dictionary Accessors -

- (KGViewSeparatorConfiguration *)kg_configurationForSeparatorOfType:(KGViewSeparatorType)type {
    return [[self kg_configurationDictionary] objectForKey:[self kg_separatorViewKeyOfType:type]];
}

- (void)kg_setConfiguration:(KGViewSeparatorConfiguration *)configuration forSeparatorOfType:(KGViewSeparatorType)type {
    [[self kg_configurationDictionary] setObject:configuration forKey:[self kg_separatorViewKeyOfType:type]];
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