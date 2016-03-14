//
//  AddCategoryViewController.swift
//  PayGeek
//
//  Created by Sumit Pal on 3/13/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddCategoryViewController: UIViewController {

    @IBOutlet weak var AddCatID: UITextField!
    @IBOutlet weak var AddDesc: UITextField!
    
    var NewCategory : Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SavePressed(sender: AnyObject) {
        print(AddCatID.text);
        print(AddDesc.text);
        
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        NewCategory = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: moc) as! Category
        
        self.NewCategory.id = AddCatID.text!
        self.NewCategory.desc = AddDesc.text!
        
        do {
            try moc.save()
        } catch let error as NSError {
            // failure
            print("Insert DB Error \(error.localizedDescription) ")
            return
        }
        
        self.dismissViewControllerAnimated(true, completion: nil )
        
    }
    
    @IBAction func CancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil )
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
