//
//  Income.swift
//  PayGeek
//
//  Created by Young Kwon on 3/11/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

@objc(Income)

class Income: NSManagedObject {
    @NSManaged var name : String!
    @NSManaged var amount : String!
    @NSManaged var category : String!
}



