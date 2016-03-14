//
//  Category.swift
//  PayGeek
//
//  Created by Sumit Pal on 3/13/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class Category: NSManagedObject {
    @NSManaged var id : String!
    @NSManaged var desc : String!

}
