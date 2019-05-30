//
//  ViewController.swift
//  DynamicHeightTableView
//
//  Created by Mithun on 30/05/19.
//  Copyright © 2019 Mithun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // This array contains the sample data to populate the tableview. Each element dictates the number of labels to be shown in the cell
    var tableData = [1,2,3,2,3,2]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelRow", for: indexPath) as! LabelTableViewCell
        
        let labelCount = tableData[indexPath.row]
        
        // Check the label count for the current row to decide how many labels to show.
        // Extra lables are hidden
        switch labelCount {
        case 1:
            cell.label1.isHidden = false
            cell.label2.isHidden = true
            cell.label3.isHidden = true
        case 2:
            cell.label1.isHidden = false
            cell.label2.isHidden = false
            cell.label3.isHidden = true
        default:
            cell.label1.isHidden = false
            cell.label2.isHidden = false
            cell.label3.isHidden = false
        }
        
        return cell
    }
}

