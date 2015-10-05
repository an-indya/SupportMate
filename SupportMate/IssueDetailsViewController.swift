//
//  IssueDetailsViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/11/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit

class IssueDetailsViewController: UIViewController {

    @IBOutlet weak var moduleName: UILabel!
    @IBOutlet weak var issueDate: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var resolution: UILabel!
    @IBOutlet weak var indicator: UIView!
    internal var issue: Issues!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moduleName.text = issue.issueModule
        details.text = issue.issueDescription
        resolution.text = issue.issueResolution
        resolution.sizeToFit()
        indicator.backgroundColor = issue.isResolved ? UIColor.Good() : UIColor.Alarm()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let str = dateFormatter.stringFromDate(issue.issueDate)
        issueDate.text = str


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
