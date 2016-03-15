//
//  AddViewController.swift
//  PayGeek
//
//  Created by Young Kwon on 3/11/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {


    @IBOutlet var name: UITextField!
    @IBOutlet var amount: UITextField!
    @IBOutlet var category: UITextField!

    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var ieText : String! = "Income"
    
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
    
    
    
    
    var NewIncome : Income!
    var NewExpense: Expense!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            self.NewIncome?.category = self.category.text!

        }
        else if (ieText == "Expense"){
            NewExpense = NSEntityDescription.insertNewObjectForEntityForName("Expense", inManagedObjectContext: myMOC) as! Expense
            self.NewExpense?.name = self.name.text!
            self.NewExpense?.amount = self.amount.text!
            self.NewExpense?.category = self.category.text!
            
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
