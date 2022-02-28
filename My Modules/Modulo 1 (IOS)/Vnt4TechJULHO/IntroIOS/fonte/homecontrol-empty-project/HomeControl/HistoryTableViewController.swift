//
//  HistoryTableViewController.swift
//  HomeControl
//
//  Created by Vntlab on 7/15/16.
//  Copyright © 2016 venturus. All rights reserved.
//

import Foundation
import UIKit

class HistoryTableViewController: UITableViewController {
    
    var tableViewHomeInfoArray = [String]()
//    var data = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
//                "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
//                "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
//                "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
//                "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableViewHomeInfoArray.count
//        return data.count
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        cell.textLabel?.text = tableViewHomeInfoArray[indexPath.section]
//        cell.textLabel?.text = data[indexPath.section]
        
        return cell
    }
    
}