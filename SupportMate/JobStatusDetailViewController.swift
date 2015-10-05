//
//  JobStatusDetailViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/1/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

class JobStatusDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var jobName: UILabel!
    @IBOutlet weak var scheduledTime: UILabel!
    @IBOutlet weak var jobStatus: UILabel!
    @IBOutlet weak var history: UITableView!
    @IBOutlet weak var finishTime: UILabel!
    internal var job:Jobs!
    var historyList = [FailHistory]()
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobName.text = job.jobName
        scheduledTime.text = job.scheduledTime

        jobStatus.text = job.isSuccessful ? job.didFinish ? "Successful" : "Running" : "Failed"
        finishTime.text = job.didFinish ? job.actualTime : job.isSuccessful ? "Running" : "Failed"
        history.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        let barbuttonItem = UIBarButtonItem(title: "Add Comment", style: .Plain, target: self, action: "addComment")
        self.navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    func addComment () {
        performSegueWithIdentifier("showComment", sender: self)
    }

    @IBAction func callTeamMember(sender: UIButton) {
        let url = NSURL(string: "tel://2013304444")
        UIApplication.sharedApplication().openURL(url!)
        
        let alert = UIAlertController(title: "Call Sanjay", message: "You are going to make a call to Sanjay Saxena, Senior Systems Analyst, shift timings: 10:00 PM to 6:00 AM. Are you sure?" , preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Call +919856452525", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    override func viewDidAppear(animated: Bool) {
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "FailHistory")
        let predicate = NSPredicate(format: "jobId == \(self.job.jobId)")
        fetchRequest.predicate = predicate
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [FailHistory] {
            historyList = fetchResults
        }
        history?.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.history.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let today = NSDate.init();
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let weekdayComponents = gregorian?.component(NSCalendarUnit.Day, fromDate: today)
        let day = weekdayComponents
        
        cell.textLabel?.text = job.jobId == "12355" ? "6/\(day! - indexPath.row)/2015 - Failed" : "6/\(day! - indexPath.row)/2015 - Passed"
        cell.textLabel?.font = UIFont(name: "GillSans", size: 14)
        
        tableView.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showComment") {
            let destinationViewController = segue.destinationViewController as! AddCommentViewController;
            destinationViewController.job = job
        }
    }

}
