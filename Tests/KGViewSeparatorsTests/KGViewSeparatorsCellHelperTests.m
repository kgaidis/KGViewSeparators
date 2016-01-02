//
//  KGViewSeparatorsCellHelperTests.m
//  KGViewSeparatorsTests
//
//  Created by Krisjanis Gaidis on 1/2/16.
//
//

#import <XCTest/XCTest.h>
#import "UITableViewCell+KGViewSeparators.h"
#import "KGViewSeparatorConfiguration+Defaults.h"

@interface KGViewSeparatorsCellHelperTests : XCTestCase

@property (strong, nonatomic) UITableViewCell *cell;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) UIEdgeInsets insets;


@end

@implementation KGViewSeparatorsCellHelperTests

- (void)setUp {
    [super setUp];
    self.cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.color = [UIColor blackColor];
    self.lineWidth = 1.0;
    self.insets = UIEdgeInsetsMake(0, 15, 0, 15);
}

- (void)tearDown {
    [super tearDown];
    self.cell = nil;
    self.color = nil;
}

#pragma mark - Top -

- (void)testTopSeparatorColorOption {
    XCTAssert(self.cell.contentView.subviews.count == 0);
    [self.cell kg_showTopSeparator:true color:self.color];
    XCTAssert(self.cell.contentView.subviews.count == 1);
}

- (void)testTopSeparatorColorLineWidthOptions {
    XCTAssert(self.cell.contentView.subviews.count == 0);
    [self.cell kg_showTopSeparator:true color:self.color lineWidth:self.lineWidth];
    XCTAssert(self.cell.contentView.subviews.count == 1);
}

- (void)testTopSeparatorAllOptions {
    XCTAssert(self.cell.contentView.subviews.count == 0);
    [self.cell kg_showTopSeparator:true color:self.color lineWidth:self.lineWidth insets:self.insets];
    XCTAssert(self.cell.contentView.subviews.count == 1);
}

#pragma mark - Bottom -

- (void)testBottomSeparatorColorOption {
    XCTAssert(self.cell.contentView.subviews.count == 0);
    [self.cell kg_showBottomSeparator:true color:self.color];
    XCTAssert(self.cell.contentView.subviews.count == 1);
}

- (void)testBottomSeparatorColorLineWidthOptions {
    XCTAssert(self.cell.contentView.subviews.count == 0);
    [self.cell kg_showBottomSeparator:true color:self.color lineWidth:self.lineWidth];
    XCTAssert(self.cell.contentView.subviews.count == 1);
}

- (void)testBottomSeparatorAllOptions {
    XCTAssert(self.cell.contentView.subviews.count == 0);
    [self.cell kg_showBottomSeparator:true color:self.color lineWidth:self.lineWidth insets:self.insets];
    XCTAssert(self.cell.contentView.subviews.count == 1);
}

@end
