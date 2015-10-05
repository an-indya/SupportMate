//
//  CommentsViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/14/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

class CommentsViewController: UITableViewController {

    var comments = [Comments]()
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "Comments")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Comments] {
            comments = fetchResults
            tableView?.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return comments.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        
        let comment = comments[indexPath.row] as Comments
        cell.textLabel?.text = comment.comment
        cell.textLabel?.font = UIFont(name: "GillSans", size: 14)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showCommentsReadOnly", sender: self)
    }


    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCommentsReadOnly" {
            let indexPath: NSIndexPath? = tableView?.indexPathForSelectedRow
            let viewController = segue.destinationViewController as! AddCommentViewController
            viewController.commentObj = comments[indexPath!.row]
        }
    }
}
