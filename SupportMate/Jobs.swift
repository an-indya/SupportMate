//
//  Jobs.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/11/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData

class Jobs: NSManagedObject {

    @NSManaged var didFinish: Bool
    @NSManaged var isSuccessful: Bool
    @NSManaged var jobId: String
    @NSManaged var jobName: String
    @NSManaged var scheduledTime: String
    @NSManaged var actualTime: String

}
