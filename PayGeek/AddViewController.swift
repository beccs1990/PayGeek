//
//  AddViewController.swift
//  PayGeek
//
//  Created by Young Kwon on 3/11/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var name: UITextField!
    @IBOutlet var amount: UITextField!
    var pickCat : String = ""
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var ieText : String! = ""
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController!
    
    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            ieText = "Income"
        case 1:
            ieText = "Expense"
        default:
            break;
        }
    }
    
    var MyCategory : [Category] = []
    
    //var arr: NSArray = ["LON","MOR","MIS"]
    
    var NewIncome : Income!
    var NewExpense: Expense!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fr = NSFetchRequest(entityName: "Category")
        
        do {
            MyCategory = try moc.executeFetchRequest(fr) as! [Category]
            
            print("count in : \(MyCategory.count) in category")
            //pickCat = MyCategory[0].id as String
            //ieText = "Income"
            //catTableView.reloadData()
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        //arr = ["LON","MOR","MIS"]
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        let fr = NSFetchRequest(entityName: "Category")
        
        do {
            MyCategory = try moc.executeFetchRequest(fr) as! [Category]
            pickCat = MyCategory[0].id as String
            ieText = "Income"
            //catTableView.reloadData()
            //self.tableView.reloadData()
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MyCategory.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(MyCategory[row].id)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickCat = MyCategory[row].id as String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ClickedCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func ClickedSave(sender: AnyObject) {
        
        //ieText = IncExp.text!
        
        let myMOC = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        if (ieText == "Income"){
            
            NewIncome = NSEntityDescription.insertNewObjectForEntityForName("Income", inManagedObjectContext: myMOC) as! Income
            self.NewIncome?.name = self.name.text!
            self.NewIncome?.amount = self.amount.text!
            self.NewIncome?.category = pickCat
            
        }
        else if (ieText == "Expense"){
            NewExpense = NSEntityDescription.insertNewObjectForEntityForName("Expense", inManagedObjectContext: myMOC) as! Expense
            self.NewExpense?.name = self.name.text!
            self.NewExpense?.amount = self.amount.text!
            self.NewExpense?.category = pickCat
            
        }
        do{
            try myMOC.save()
        } catch let error as NSError{
            print("DB error \(error.localizedDescription)")
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
