//
//  UITableViewCell+Separators.swift
//  KGViewSeparatorsExample
//
//  Created by Krisjanis Gaidis on 12/28/15.
//  Copyright © 2015 KG. All rights reserved.
//

import Foundation

extension UITableViewCell {
    func showTopSeparator(show: Bool) {
        self.contentView.kg_show(show, separator: .Top, color:  UIColor.blackColor(), lineWidth: (1.0 / UIScreen.mainScreen().scale), insets: UIEdgeInsetsZero)
    }
    
    func showBottomSeparator(show: Bool) {
        self.contentView.kg_show(show, separator: .Bottom, color:  UIColor.blackColor(), lineWidth: (1.0 / UIScreen.mainScreen().scale), insets: UIEdgeInsetsZero)
    }
}