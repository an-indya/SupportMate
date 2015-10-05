//
//  Issues.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/11/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData

class Issues: NSManagedObject {

    @NSManaged var issueId: NSNumber
    @NSManaged var issueModule: String
    @NSManaged var issueDescription: String
    @NSManaged var issueResolution: String
    @NSManaged var issueDate: NSDate
    @NSManaged var isResolved: Bool

}
