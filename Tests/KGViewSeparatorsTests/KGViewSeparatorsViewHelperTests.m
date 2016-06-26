//
//  KGViewSeparatorsViewHelperTests.m
//  KGViewSeparatorsTests
//
//  Created by Krisjanis Gaidis on 1/2/16.
//
//

#import <XCTest/XCTest.h>
#import "UIView+KGViewSeparators.h"
#import "KGViewSeparatorConfiguration+Defaults.h"

@interface KGViewSeparatorsViewHelperTests : XCTestCase

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) UIEdgeInsets insets;

@end

@implementation KGViewSeparatorsViewHelperTests

- (void)setUp {
    [super setUp];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.color = [UIColor blackColor];
    self.lineWidth = 1.0;
    self.insets = UIEdgeInsetsMake(0, 15, 0, 15);
}

- (void)tearDown {
    [super tearDown];
    self.view = nil;
    self.color = nil;
}

#pragma mark - Top -

- (void)testTopSeparatorColorOption {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_show:true separator:KGViewSeparatorTop color:self.color];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testTopSeparatorColorLineWidthOptions {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_show:true separator:KGViewSeparatorTop color:self.color lineWidth:self.lineWidth];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testTopSeparatorAllOptions {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_show:true separator:KGViewSeparatorTop color:self.color lineWidth:self.lineWidth insets:self.insets];
    XCTAssert(self.view.subviews.count == 1);
}

#pragma mark - Bottom -

- (void)testBottomSeparatorColorOption {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_show:true separator:KGViewSeparatorBottom color:self.color];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testBottomSeparatorColorLineWidthOptions {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_show:true separator:KGViewSeparatorBottom color:self.color lineWidth:self.lineWidth];
    XCTAssert(self.view.subviews.count == 1);
}

- (void)testBottomSeparatorAllOptions {
    XCTAssert(self.view.subviews.count == 0);
    [self.view kg_show:true separator:KGViewSeparatorBottom color:self.color lineWidth:self.lineWidth insets:self.insets];
    XCTAssert(self.view.subviews.count == 1);
}

#pragma mark - Other

- (void)testReturningSeparatorView {
    UIView *separatorInserted = [self.view kg_show:true separator:KGViewSeparatorTop color:self.color lineWidth:self.lineWidth insets:self.insets];
    XCTAssertNotNil(separatorInserted);
    separatorInserted = [self.view kg_show:false separator:KGViewSeparatorTop color:self.color lineWidth:self.lineWidth insets:self.insets];
    XCTAssertNotNil(separatorInserted);
}

@end
