//
//  KGViewSeparatorsTests.m
//  KGViewSeparatorsTests
//
//  Created by Krisjanis Gaidis on 12/29/15.
//
//

#import <XCTest/XCTest.h>
#import "UIView+KGViewSeparators.h"
#import "KGViewSeparatorConfiguration+Defaults.h"

@interface KGViewSeparatorsTests : XCTestCase

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) KGViewSeparatorConfiguration *defaultConfiguration;

@end

@implementation KGViewSeparatorsTests

- (void)setUp {
    [super setUp];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.defaultConfiguration = [[KGViewSeparatorConfiguration alloc] init];
}

- (void)tearDown {
    [super tearDown];
    self.view = nil;
    self.defaultConfiguration = nil;
}

#pragma mark - Test Insertion of Views -

- (void)testAddingTopSeparator {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testAddingBottomSeparator {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testAddingMultipleTopSeparators {
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testAddingMultipleBottomSeparators {
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews.count == 1);
}

#pragma mark - Separator Views and Configuration Interaction -

- (void)testConfigurationColorAffectingTopSeparator {
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert([self.view.subviews[0].backgroundColor isEqual:self.defaultConfiguration.color]);
}

- (void)testConfigurationColorAffectingBottomSeparator {
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    XCTAssert([self.view.subviews[0].backgroundColor isEqual:self.defaultConfiguration.color]);
}

- (void)testConfigurationLineWidthAffectingTopSeparator {
    CGFloat lineWidth = 2.0;
    KGViewSeparatorConfiguration *configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:[UIColor blackColor] lineWidth:lineWidth insets:UIEdgeInsetsZero];
    [self.view kg_showTopSeparator:true configuration:configuration];
    XCTAssert(self.view.subviews[0].frame.size.height == 0);
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    XCTAssert(self.view.subviews[0].frame.size.height == lineWidth);
}

- (void)testConfigurationLineWidthAffectingBottomSeparator {
    CGFloat lineWidth = 2.0;
    KGViewSeparatorConfiguration *configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:[UIColor blackColor] lineWidth:lineWidth insets:UIEdgeInsetsZero];
    [self.view kg_showBottomSeparator:true configuration:configuration];
    XCTAssert(self.view.subviews[0].frame.size.height == 0);
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    XCTAssert(self.view.subviews[0].frame.size.height == lineWidth);
}

- (void)testConfigurationInsetsAffectingTopSeparator {
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 15, 0, 15);
    KGViewSeparatorConfiguration *configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:[UIColor blackColor] lineWidth:1.0 insets:insets];
    [self.view kg_showTopSeparator:true configuration:configuration];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    XCTAssert(self.view.subviews[0].frame.origin.x == insets.left);
    XCTAssert(CGRectGetMaxX(self.view.subviews[0].frame) == self.view.frame.size.width - insets.right);
}

- (void)testConfigurationInsetsAffectingBottomSeparator {
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 15, 0, 15);
    KGViewSeparatorConfiguration *configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:[UIColor blackColor] lineWidth:1.0 insets:insets];
    [self.view kg_showBottomSeparator:true configuration:configuration];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    XCTAssert(self.view.subviews[0].frame.origin.x == insets.left);
    XCTAssert(CGRectGetMaxX(self.view.subviews[0].frame) == self.view.frame.size.width - insets.right);
}

- (void)testConfigurationChangesForTopSeparator {
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert([self.view.subviews[0].backgroundColor isEqual:self.defaultConfiguration.color]);
    KGViewSeparatorConfiguration *newConfiguration = [[KGViewSeparatorConfiguration alloc] initWithColor:[UIColor purpleColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
    [self.view kg_showTopSeparator:true configuration:newConfiguration];
    XCTAssert([self.view.subviews[0].backgroundColor isEqual:newConfiguration.color]);
}

- (void)testConfigurationChangesForBottomSeparator {
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    XCTAssert([self.view.subviews[0].backgroundColor isEqual:self.defaultConfiguration.color]);
    KGViewSeparatorConfiguration *newConfiguration = [[KGViewSeparatorConfiguration alloc] initWithColor:[UIColor purpleColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
    [self.view kg_showBottomSeparator:true configuration:newConfiguration];
    XCTAssert([self.view.subviews[0].backgroundColor isEqual:newConfiguration.color]);
}
#pragma mark - Test Showing / Hiding -

- (void)testShowingAndHidingTopSeparator {
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews[0].hidden == NO);
    [self.view kg_showTopSeparator:false configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews[0].hidden == YES);
}

- (void)testShowingAndHidingBottomSeparator {
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews[0].hidden == NO);
    [self.view kg_showBottomSeparator:false configuration:self.defaultConfiguration];
    XCTAssert(self.view.subviews[0].hidden == YES);
}

#pragma mark - Test Constraints -

- (void)testTopSeparatorConstraintsExistance {
    XCTAssert(self.view.constraints.count == 0);
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.constraints.count > 0);
}

- (void)testBottomSeparatorConstraintsExistance {
    XCTAssert(self.view.constraints.count == 0);
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.constraints.count > 0);
}

- (void)testConstraintsPilingUpForTopSeparator {
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    NSInteger amountOfConstraints = self.view.constraints.count;
    [self.view kg_showTopSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.constraints.count == amountOfConstraints);
}

- (void)testConstraintsPilingUpForBottomSeparator {
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    NSInteger amountOfConstraints = self.view.constraints.count;
    [self.view kg_showBottomSeparator:true configuration:self.defaultConfiguration];
    XCTAssert(self.view.constraints.count == amountOfConstraints);
}

#pragma mark - Test Configuration -

- (void)testDefaultConfiguration {
    KGViewSeparatorConfiguration *configuration = [KGViewSeparatorConfiguration new];
    XCTAssert([configuration.color isEqual:[KGViewSeparatorConfiguration defaulColor]]);
    XCTAssert(configuration.lineWidth == [KGViewSeparatorConfiguration defaultLineWidth]);
    XCTAssert(UIEdgeInsetsEqualToEdgeInsets(configuration.insets, [KGViewSeparatorConfiguration defaultInsets]));
}

- (void)testConfigurationFullInitializer {
    UIColor *color = [UIColor redColor];
    CGFloat lineWidth = 40.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 70, 0, 3);
    KGViewSeparatorConfiguration *configuration = [[KGViewSeparatorConfiguration alloc] initWithColor:color lineWidth:lineWidth insets:insets];
    XCTAssert([configuration.color isEqual:color]);
    XCTAssert(configuration.lineWidth == lineWidth);
    XCTAssert(UIEdgeInsetsEqualToEdgeInsets(configuration.insets, insets));
}

@end
