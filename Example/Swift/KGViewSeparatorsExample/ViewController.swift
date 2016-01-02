//
//  ViewController.swift
//  KGViewSeparatorsExample
//
//  Created by Krisjanis Gaidis on 12/28/15.
//  Copyright © 2015 KG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Constants -
    private let kNumberOfRows = 100
    private let kCellHeight: CGFloat = 44.0
    
    // MARK: - IBOutlets -
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .None
    }
    
    // MARK: - Overrides -
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// MARK: - <UITableViewDataSource, UITableViewDelegate> -
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kNumberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.showTopSeparator(indexPath.row == 0)
        cell.showBottomSeparator(true)

        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return kCellHeight
    }
}