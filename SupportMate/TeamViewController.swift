//
//  TeamViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 5/10/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

let reuseIdentifier = "TeamCollectionViewCell"

class TeamViewController: UICollectionViewController  {

    var teamMembers = [TeamMember]()
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Team Members"
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        if appDel.role == "Manager" {
            let barbuttonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addTeamMember")
            self.navigationItem.rightBarButtonItem = barbuttonItem
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "TeamMember")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [TeamMember] {
            teamMembers = fetchResults
            print(teamMembers)
            collectionView?.reloadData()
        }
        
    }
    
    func addTeamMember () {
       performSegueWithIdentifier("AddMemberDetails", sender: self)
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UICollectionViewCell
        if segue.identifier == "ShowTeamMemberDetails" {
            let indexPath = collectionView!.indexPathForCell(cell)
            
            let destinationViewController = segue.destinationViewController as! TeamMemberDetailsViewController;
            destinationViewController.teamMember = teamMembers[indexPath!.row]
        }
        else if segue.identifier == "AddMemberDetails" {
            
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamMembers.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TeamCollectionViewCell
        let member = teamMembers[indexPath.row] as TeamMember
        let image = UIImage(named: member.image)
        cell.teamMember.image = image
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    */




}
