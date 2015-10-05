//
//  AddCommentViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/14/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData
import QuartzCore

class AddCommentViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var jobIDLabel: UILabel!
    @IBOutlet weak var lettersRemainingLabel: UILabel!
    @IBOutlet weak var addcommentTextView: UITextView!
    @IBOutlet weak var addComment: UIButton!
    @IBOutlet weak var spaceContraint: NSLayoutConstraint!
    internal var job: Jobs!
    internal var commentObj: Comments?
    var totalnumberAllowed = 200
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if commentObj != nil {
            populateComment()
        }
        else {
            jobIDLabel.text = job.jobName
        }
        addcommentTextView.layer.borderColor = UIColor.grayColor().CGColor
        addcommentTextView.layer.borderWidth = 1.0
        addcommentTextView.layer.cornerRadius = 4
        
        // Do any additional setup after loading the view.
    }
    

    func populateComment() {
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "Jobs")
        _ = NSPredicate(format: "jobID = \(commentObj!.jobID)")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Jobs] {
            jobIDLabel.text = fetchResults[0].jobName
        }
        addcommentTextView.text = commentObj!.comment
        addComment.enabled = false
        lettersRemainingLabel.hidden = true
        addcommentTextView.userInteractionEnabled = false
        self.title = "View Comment"        
    }
    
    @IBAction func cancelButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func addCommentButtonTap(sender: AnyObject) {
        if addcommentTextView.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty == false {
        let comment = NSEntityDescription.insertNewObjectForEntityForName("Comments", inManagedObjectContext: self.managedObjectContext!) as! Comments
        comment.comment = addcommentTextView.text
        comment.jobID = Int(job.jobId)!
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        totalnumberAllowed--
        totalnumberAllowed = max(totalnumberAllowed, 0)
        lettersRemainingLabel.text = "\(totalnumberAllowed) letters remaining"
        return textView.text.characters.count <= 200
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
