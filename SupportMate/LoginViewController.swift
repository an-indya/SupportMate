//
//  LoginViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/14/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var teamMembers = [TeamMember]()
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        if validateCredentials(userNameTextField.text!, password: passwordTextField.text!) {
            self.performSegueWithIdentifier("showTabBarController", sender: self)
        }
        else {
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    private func validateCredentials(username: String, password: String) -> Bool {
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "TeamMember")
        var isValid = false
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [TeamMember] {
            teamMembers = fetchResults
        }
        
        teamMembers = teamMembers.filter({$0.username == username && $0.password == password})
        if teamMembers.count > 0 {
            isValid = true
            appDel.role = teamMembers[0].designation == "Manager" ? teamMembers[0].designation : "Team Member"
        }
        else {
            appDel.role = "Team Member"
            let alert = UIAlertController(title: "Invalid Credentials", message: "The username or password you entered is incorrect. Please try again!" , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        return isValid
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
