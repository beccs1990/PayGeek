//
//  AddCategoryViewController.swift
//  PayGeek
//
//  Created by Sumit Pal on 3/13/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var AddCatID: UITextField!
    @IBOutlet weak var AddDesc: UITextField!
    
    @IBOutlet var catTableView: UITableView!
    
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController!
    
    var MyCategory : [Category] = []
    
    var NewCategory : Category!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catTableView.dataSource = self
        catTableView.delegate = self
        catTableView.registerClass(CategoryViewCell.self, forCellReuseIdentifier: "CategoryCell")
        
        let fr = NSFetchRequest(entityName: "Category")
        
        do {
            MyCategory = try moc.executeFetchRequest(fr) as! [Category]
            
        print("count in : \(MyCategory.count) in category")
            catTableView.reloadData()
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        let fr = NSFetchRequest(entityName: "Category")
        
        do {
            MyCategory = try moc.executeFetchRequest(fr) as! [Category]
            catTableView.reloadData()
            //self.tableView.reloadData()
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
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
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyCategory.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryViewCell
        
        cell.textLabel!.text = MyCategory[indexPath.row].id
        
        return cell
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
