//
//  ViewController.swift
//  CIS55_Project_2
//
//  Created by profile on 3/9/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var incomeTab: UITableView!
    @IBOutlet var expenseTab: UITableView!
    
    struct PreviewDetail {
        let title: String
    }
    
    let sampleData = [
        PreviewDetail(title: "Small"),
        PreviewDetail(title: "Medium"),
        PreviewDetail(title: "Large")
    ]
    
    let sampleData1 = [
        PreviewDetail(title: "One"),
        PreviewDetail(title: "Two"),
        PreviewDetail(title: "Three"),
        PreviewDetail(title: "More")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        incomeTab.dataSource = self
        incomeTab.delegate = self
        incomeTab.registerClass(IncomeViewCell.self, forCellReuseIdentifier: "incomeOver")
        
        expenseTab.dataSource = self
        expenseTab.delegate = self
        expenseTab.registerClass(ExpenseViewCell.self, forCellReuseIdentifier: "expenseRecent")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count: Int?
        
        if tableView == self.incomeTab {
            count = sampleData.count
        }
        
        if tableView == self.expenseTab {
            count =  sampleData1.count
        }
        
        return count!
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.incomeTab {
            cell = tableView.dequeueReusableCellWithIdentifier("incomeOver", forIndexPath: indexPath)
            let previewDetail = sampleData[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
        if tableView == self.expenseTab {
            cell = tableView.dequeueReusableCellWithIdentifier("expenseRecent", forIndexPath: indexPath)
            let previewDetail = sampleData1[indexPath.row]
            cell!.textLabel!.text = previewDetail.title
            
        }
        
        
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("did select:      \(indexPath.row)  ")
    }
    
    
    
}


