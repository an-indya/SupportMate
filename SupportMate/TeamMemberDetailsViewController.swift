//
//  TeamMemberDetailsViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/7/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

class TeamMemberDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DesignationLabel: UILabel!    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet var holidayList: UITableView!
    
    var holidays = [Holidays]()
    internal var teamMember: TeamMember!
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(teamMember != nil, "team member must not be null")
        bioLabel.text = teamMember!.bio
        NameLabel.text = teamMember.firstName + " " + teamMember.lastName
        DesignationLabel.text = teamMember.designation
        profileImage.image = UIImage(named: teamMember.image)
        
        holidayList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(animated: Bool) {
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "Holidays")
        let predicate = NSPredicate(format: "memberID == \(self.teamMember.memberID)")
        fetchRequest.predicate = predicate
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Holidays] {
           holidays = fetchResults
        }
        holidayList?.reloadData()
    }

    
    // MARK: - UITableView Delegates
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidays.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.holidayList.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let holiday = holidays[indexPath.row] as Holidays
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let str = dateFormatter.stringFromDate(holiday.leaveDate)
        cell.textLabel?.text = str
        
        tableView.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
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
