//
//  TeamMember.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/11/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData

class TeamMember: NSManagedObject {

    @NSManaged var bio: String
    @NSManaged var designation: String
    @NSManaged var experience: NSNumber
    @NSManaged var firstName: String
    @NSManaged var image: String
    @NSManaged var lastName: String
    @NSManaged var memberID: NSNumber
    @NSManaged var shiftStart: String
    @NSManaged var shiftEnd: String
    @NSManaged var contactNumber: String
    @NSManaged var username: String
    @NSManaged var password: String

}
