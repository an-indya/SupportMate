//
//  Comments.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/14/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData

class Comments: NSManagedObject {

    @NSManaged var jobID: NSNumber
    @NSManaged var comment: String
    @NSManaged var createdBy: NSNumber
    @NSManaged var createdOn: NSDate

}
