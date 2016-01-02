//
//  ViewController.m
//  KGViewSeparators
//
//  Created by Krisjanis Gaidis on 12/27/15.
//  Copyright © 2015 KG. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+Separators.h"

static const NSInteger kNumberOfRows = 100;
static const CGFloat kCellHeight = 44.0;

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

// IBOutlet's
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - Lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Overrides -

- (BOOL)prefersStatusBarHidden {
    return true;
}

#pragma mark - <UITableViewDataSource/UITableViewDelegate> -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BOOL even = (indexPath.row % 2 == 0);
    [cell showGreenTopSeparator:even];
    [cell showRedBottomSeparator:even];
    
    if (indexPath.row % 4 == 0) {
        [cell showBlackBottomSeparator:true];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

@end