//
//  JobStatusViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

class JobStatusViewController: UITableViewController  {
    

    
    
    var jobs = [Jobs]()
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext

    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Job Status"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "Jobs")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Jobs] {
            jobs = fetchResults.sort({ (a, b) -> Bool in
                a.jobId < b.jobId
            })
            
            tableView?.reloadData()
        }
        
    }

    // MARK: Table View Delegates
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jobs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let job = jobs[indexPath.row] as Jobs
        cell.textLabel?.text = job.jobName
        cell.detailTextLabel?.text = job.isSuccessful ? "\(NSDate.init())" : ""
        cell.textLabel?.font = UIFont(name: "GillSans", size: 14)
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton

        
        if job.isSuccessful && job.didFinish {
            cell.backgroundColor = UIColor.Good()
            cell.imageView?.image = UIImage(named: "Check")
        }
        else if job.isSuccessful && !job.didFinish {
            cell.backgroundColor = UIColor.Warning()
            cell.imageView?.image = UIImage(named: "Clock")
        }
        else if !job.isSuccessful && job.didFinish {
            cell.backgroundColor = UIColor.Alarm()
            cell.imageView?.image = UIImage(named: "Error")
        }
        else {
            cell.backgroundColor = UIColor.Alarm()
            cell.imageView?.image = UIImage(named: "Error")
        }
        
        tableView.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = JobStatusDetailViewController()
        self.performSegueWithIdentifier("ShowJobStatusDetailsSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowJobStatusDetailsSegue") {
            let indexPath: NSIndexPath? = tableView?.indexPathForSelectedRow
            let destinationViewController = segue.destinationViewController as! JobStatusDetailViewController;
            destinationViewController.job = jobs[indexPath!.row]
        }
    }
    
}

