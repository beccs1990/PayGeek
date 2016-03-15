//
//  Income.swift
//  PayGeek
//
//  Created by Young Kwon on 3/14/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class Income: NSManagedObject {
    @NSManaged var amount: String!
    @NSManaged var category: String!
    @NSManaged var name: String!
}

