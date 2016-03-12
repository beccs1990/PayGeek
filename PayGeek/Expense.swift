//
//  Expense.swift
//  PayGeek
//
//  Created by Young Kwon on 3/11/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

@objc(Expense)

class Expense: NSManagedObject {
    @NSManaged var name : String!
    @NSManaged var amount : String!
    @NSManaged var category : String!
}
