//
//  AddTeamMemberViewController.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/21/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import UIKit
import CoreData

class AddTeamMemberViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var teamMemberIDTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var bioTextView: UITextView!
    let managedObjectContext = ((UIApplication.sharedApplication()).delegate as!AppDelegate).managedObjectContext
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImage(sender: UIButton) {
        
    }
    
    @IBAction func addMemberButtonTapped(sender: AnyObject) {
        
        if validateInput() {
            let member = NSEntityDescription.insertNewObjectForEntityForName("TeamMember", inManagedObjectContext: self.managedObjectContext!) as! TeamMember
            let f = NSNumberFormatter()
            f.numberStyle = NSNumberFormatterStyle.NoStyle
            let memberID = f.numberFromString(teamMemberIDTextField.text!)
            member.memberID = memberID!
            member.firstName = firstNameTextField.text!
            member.lastName = lastNameTextField.text!
            member.experience = 1
            member.image = "Profile.png"
            member.bio = bioTextView.text
            member.designation = designationTextField.text!
            member.shiftStart = "10:00 PM"
            member.shiftEnd = "07:00 AM"
            member.contactNumber = "+919856452525"
            member.username = firstNameTextField.text!
            member.password = "password"
            
            self.navigationController?.popViewControllerAnimated(true)
        }
        else {
            let alert = UIAlertController(title: "Invalid Input", message: "The Associate ID can not have alphabets or special characters. Please enter valid Associate ID!" , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func validateInput() -> Bool {
        let intVal = Scanner(string: teamMemberIDTextField.text!).scanInt()
        return intVal > 0 && firstNameTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).characters.count > 0 && lastNameTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).characters.count > 0
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    struct Scanner {
        let scanner : NSScanner
        
        init(string: String) {
            scanner = NSScanner(string: string)
        }
        
        func scanInt() -> Int? {
            var int : CInt = 0
            let didScan = scanner.scanInt(&int)
            return didScan ? Int(int) : nil
        }
        
        func scan(token : String) -> Bool {
            return scanner.scanString(token, intoString: nil)
        }
    }

}
