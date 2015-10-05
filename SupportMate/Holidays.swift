//
//  Holidays.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/11/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData

class Holidays: NSManagedObject {

    @NSManaged var leaveDate: NSDate
    @NSManaged var memberID: NSNumber

}
