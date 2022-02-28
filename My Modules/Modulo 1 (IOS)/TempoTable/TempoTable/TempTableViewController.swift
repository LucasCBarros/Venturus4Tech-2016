//
//  TempTableViewController.swift
//  TempoTable
//
//  Created by Vntlab on 7/15/16.
//  Copyright © 2016 Vntlab. All rights reserved.
//

import Foundation
import UIKit

class TempTableViewController: UITableViewController {
    
    var tempList = [String]{}
    
    override func tableview(tableview: UITableView, ) -> Int {
        return tempList.count
    }
    
    override func tableview(tableview: UITableView,) -> {
        let cell = tableview
        cell.testLabel?.text =  "Temp \()"
        
    }
}