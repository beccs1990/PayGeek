//
//  ViewController.swift
//  CIS55_Project_2
//
//  Created by profile on 3/9/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet var incomeTab: UITableView!
    @IBOutlet var expenseTab: UITableView!
    
    @IBOutlet var incomeTotal: UILabel!
    
    @IBOutlet var expenseTotal: UILabel!
    
    
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
    ///////
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController!
    
    var MyIncome : [Income] = []
    var MyExpense: [Expense] = []
    /////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        incomeTab.dataSource = self
        incomeTab.delegate = self
        incomeTab.registerClass(IncomeViewCell.self, forCellReuseIdentifier: "incomeOver")
        
        expenseTab.dataSource = self
        expenseTab.delegate = self
        expenseTab.registerClass(ExpenseViewCell.self, forCellReuseIdentifier: "expenseRecent")
        
        ////
        let fr = NSFetchRequest(entityName: "Income")
        let fr2 = NSFetchRequest(entityName: "Expense")
        
        do {
            MyIncome = try moc.executeFetchRequest(fr) as! [Income]
            MyExpense = try moc.executeFetchRequest(fr2) as! [Expense]
            
            print("count in : \(MyIncome.count)")
            print("count in : \(MyExpense.count)")
            //self.tableView.reloadData()
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        /////
        
        
    }
    ////
    override func viewDidAppear(animated: Bool) {
        //self.tableView.reloadData()
        
        let fr = NSFetchRequest(entityName: "Income")
        let fr2 = NSFetchRequest(entityName: "Expense")

        
        do {
            MyIncome = try moc.executeFetchRequest(fr) as! [Income]
            MyExpense = try moc.executeFetchRequest(fr2) as! [Expense]
            incomeTab.reloadData()
            expenseTab.reloadData()
            //self.tableView.reloadData()
            // success ...
            print("count in : \(MyIncome.count)")
            print("count in : \(MyExpense.count)")
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        var incTotal: Double = 0
        
        for var i = 0; i < MyIncome.count ; ++i {
            incTotal += Double(MyIncome[i].amount)!
        }
        incomeTotal.text = "Total: $ " + String(incTotal)
        
        var expTotal: Double = 0
        
        for var i = 0; i < MyExpense.count ; ++i {
            expTotal += Double(MyExpense[i].amount)!
        }
        expenseTotal.text = "Total: $ " + String(expTotal)
        
    }
    //////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the sample data structure.
        
        var count: Int?
        
        if tableView == self.incomeTab {
            //count = sampleData.count
            count = MyIncome.count
        }
        
        if tableView == self.expenseTab {
            //count =  sampleData1.count
            count = MyExpense.count
        }
        
        return count!
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
 //       var incomeItem : Income!
 //       var expenseItem : Expense!
        
        if tableView == self.incomeTab {
            cell = tableView.dequeueReusableCellWithIdentifier("incomeOver", forIndexPath: indexPath)
            //let previewDetail = sampleData[indexPath.row]
            //cell!.textLabel!.text = previewDetail.title
            cell!.textLabel!.text = MyIncome[indexPath.row].name + ":       $" + MyIncome[indexPath.row].amount
            
        }
        
        if tableView == self.expenseTab {
            cell = tableView.dequeueReusableCellWithIdentifier("expenseRecent", forIndexPath: indexPath)
            //let previewDetail = sampleData1[indexPath.row]
            //cell!.textLabel!.text = previewDetail.title
            cell!.textLabel!.text = MyExpense[indexPath.row].name + "       $" + MyExpense[indexPath.row].amount
        }
        
        
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("did select:      \(indexPath.row)  ")
    }
    
    
    
}


