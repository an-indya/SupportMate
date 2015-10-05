//
//  FailHistory.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/11/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData

class FailHistory: NSManagedObject {

    @NSManaged var jobId: String
    @NSManaged var failedOn: NSDate

}
