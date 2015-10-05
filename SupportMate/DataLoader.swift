//
//  DataLoader.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/7/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataLoader : NSObject {
    
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    func loadData () {
        loadTeamMembers()
        loadJobs()
        loadHolidays ()
        loadIssues ()
    }
    
    func loadJobs () {
        
        
        var finished = false
        var success = false
        var start = 12355
        let jobName = "Z_BATCHJOB"
        
        for var i=0; i < 12; ++i {
            let job = NSEntityDescription.insertNewObjectForEntityForName("Jobs", inManagedObjectContext: self.managedObjectContext!) as! Jobs
            job.jobId = "\(start++)"
            job.jobName = jobName + "_\(i+1)"
            job.scheduledTime = "1:00 AM"
            job.actualTime = "1:00 AM"
            if job.jobId == "12357" {
                job.isSuccessful = success
                job.didFinish =  !finished
                job.actualTime = "Not finished"
            }
            else
            {
                job.isSuccessful = success
                job.didFinish =  finished
            }
            success = true
            finished = true
        }
        
    }
    
    func loadTeamMembers () {
        
        let member = NSEntityDescription.insertNewObjectForEntityForName("TeamMember", inManagedObjectContext: self.managedObjectContext!) as! TeamMember
        member.memberID = 1
        member.firstName = "Sanjay"
        member.lastName = "Saxena"
        member.experience = 12
        member.image = "1.png"
        member.bio = "Sanjay is a flexible and skilled management professional with first-class experience in developing supporting and improving products for retail operations. A determinate manager with outstanding communication, negotiation and people management skills."
        member.designation = "Manager"
        member.shiftStart = "10:00 PM"
        member.shiftEnd = "07:00 AM"
        member.contactNumber = "+919856452525"
        member.username = "ssanjay"
        member.password = "password"
        
        let member1 = NSEntityDescription.insertNewObjectForEntityForName("TeamMember", inManagedObjectContext: self.managedObjectContext!) as! TeamMember
        member1.memberID = 2
        member1.firstName = "Nisha"
        member1.lastName = "Jain"
        member1.experience = 12
        member1.image = "2.png"
        member1.bio = "Nisha is an experienced Java developer with almost 12 years of experience in CoreJava, J2EE. She has got various domain experience while working with various renowned players in multiple domains ranging from Retail to Heathcare. She is also proficient with Oracle and DB2 database administration and has aquired significant experience."
        member1.designation = "Senior Systems Analyst"
        member1.shiftStart = "10:00 PM"
        member1.shiftEnd = "07:00 AM"
        member1.contactNumber = "+917678628722"
        member1.username = "jnisha"
        member1.password = "password"
        
        let member2 = NSEntityDescription.insertNewObjectForEntityForName("TeamMember", inManagedObjectContext: self.managedObjectContext!) as! TeamMember
        member2.memberID = 3
        member2.firstName = "Vinay"
        member2.lastName = "Nishad"
        member2.experience = 12
        member2.image = "3.png"
        member2.bio = "Vinay is an experienced Java developer with almost 12 years of experience in CoreJava, J2EE. He has got various domain experience while working with various renowned players in multiple domains ranging from Retail to Heathcare. He is also proficient with Oracle and DB2 database administration and has aquired significant experience."
        member2.designation = "Senior Systems Analyst"
        member2.shiftStart = "10:00 PM"
        member2.shiftEnd = "07:00 AM"
        member2.contactNumber = "+917678628722"
        member2.username = "nvinay"
        member2.password = "password"
        
        let member3 = NSEntityDescription.insertNewObjectForEntityForName("TeamMember", inManagedObjectContext: self.managedObjectContext!) as! TeamMember
        member3.memberID = 4
        member3.firstName = "Amit"
        member3.lastName = "Rajput"
        member3.experience = 12
        member3.image = "4.png"
        member3.bio = "Amit is an experienced Java developer with almost 12 years of experience in CoreJava, J2EE. He has got various domain experience while working with various renowned players in multiple domains ranging from Retail to Heathcare. He is also proficient with Oracle and DB2 database administration and has aquired significant experience."
        member3.designation = "Senior Systems Analyst"
        member3.shiftStart = "10:00 PM"
        member3.shiftEnd = "07:00 AM"
        member3.contactNumber = "+917678628722"
        member3.username = "ramit"
        member3.password = "password"
        
        let member4 = NSEntityDescription.insertNewObjectForEntityForName("TeamMember", inManagedObjectContext: self.managedObjectContext!) as! TeamMember
        member4.memberID = 5
        member4.firstName = "Sonia"
        member4.lastName = "Trivedi"
        member4.experience = 12
        member4.image = "5.png"
        member4.bio = "Sonia is a Java developer with almost 9 years of experience in CoreJava, J2EE. She has got various domain experience while working with various renowned players in multiple domains ranging from Retail to Heathcare. She is also proficient with Oracle and DB2 database administration and has aquired significant experience."
        member4.designation = "Senior Systems Analyst"
        member4.shiftStart = "10:00 PM"
        member4.shiftEnd = "07:00 AM"
        member4.contactNumber = "+917678628722"
        member4.username = "tsonia"
        member4.password = "password"
    }
    
    func loadHolidays () {
        let holiday = NSEntityDescription.insertNewObjectForEntityForName("Holidays", inManagedObjectContext: self.managedObjectContext!) as! Holidays
        holiday.memberID = 1
        holiday.leaveDate = NSDate.init()
        
        let holiday1 = NSEntityDescription.insertNewObjectForEntityForName("Holidays", inManagedObjectContext: self.managedObjectContext!) as! Holidays
        holiday1.memberID = 5
        holiday1.leaveDate = NSDate(timeIntervalSinceNow: 900000)
    }
    
    func loadIssues () {
        let issue = NSEntityDescription.insertNewObjectForEntityForName("Issues", inManagedObjectContext: self.managedObjectContext!) as! Issues
        issue.issueId = 1
        issue.issueDescription = "Database Timeout"
        issue.issueResolution = "Restart"
        issue.issueModule = "Database"
        issue.issueDate = NSDate(timeIntervalSinceNow: -200)
        issue.isResolved = true
        
        let issue1 = NSEntityDescription.insertNewObjectForEntityForName("Issues", inManagedObjectContext: self.managedObjectContext!) as! Issues
        issue1.issueId = 2
        issue1.issueDescription = "Queue Timeout"
        issue1.issueResolution = "No resolution yet"
        issue1.issueModule = "Database"
        issue1.issueDate = NSDate(timeIntervalSinceNow: -20000)
        issue1.isResolved = false
        
        
        let issue2 = NSEntityDescription.insertNewObjectForEntityForName("Issues", inManagedObjectContext: self.managedObjectContext!) as! Issues
        issue2.issueId = 3
        issue2.issueDescription = "Data issue"
        issue2.issueResolution = "Delete the problem record"
        issue2.issueModule = "Database"
        issue2.issueDate = NSDate(timeIntervalSinceNow: -400)
        issue2.isResolved = true
        
        
        let issue3 = NSEntityDescription.insertNewObjectForEntityForName("Issues", inManagedObjectContext: self.managedObjectContext!) as! Issues
        issue3.issueId = 4
        issue3.issueDescription = "Connectivity issue"
        issue3.issueResolution = "Restart"
        issue3.issueModule = "Database"
        issue3.issueDate = NSDate(timeIntervalSinceNow: -100)
        issue3.isResolved = true
        
        let issue4 = NSEntityDescription.insertNewObjectForEntityForName("Issues", inManagedObjectContext: self.managedObjectContext!) as! Issues
        issue4.issueId = 5
        issue4.issueDescription = "Database lock"
        issue4.issueResolution = "Restart after the dependent job is complete"
        issue4.issueModule = "Database"
        issue4.issueDate = NSDate(timeIntervalSinceNow: -300)
        issue4.isResolved = true
    }
    
    func loadFailHistory () {
        let failInstance = NSEntityDescription.insertNewObjectForEntityForName("FailHistory", inManagedObjectContext: self.managedObjectContext!) as! FailHistory
        failInstance.jobId = "12357"
        failInstance.failedOn = NSDate(timeInterval: -2000, sinceDate: NSDate.init())
        
        let failInstance1 = NSEntityDescription.insertNewObjectForEntityForName("FailHistory", inManagedObjectContext: self.managedObjectContext!) as! FailHistory
        failInstance1.jobId = "12357"
        failInstance1.failedOn = NSDate(timeInterval: -50000, sinceDate: NSDate.init())
        
    }
}