//
//  addViewController.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-18.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse

class addViewController: UIViewController {

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var commentlbl: UILabel!
    @IBOutlet weak var titlefld: UITextField!
    @IBOutlet weak var commentfld: UITextView!
    
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
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
    
    //MARK: ACTIONS
    
    @IBAction func savebtn(sender: AnyObject) {
        
        var title = self.titlefld.text
        var content = self.commentfld.text
        
        if let updateObject = PFObject?() {
            
            // Update the existing parse object
            updateObject["title"] = title
            updateObject["content"] = content
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        } else {
            
            // Create a new parse object
            var updateObject = PFObject(className:"Comment")
            
            updateObject["title"] = title
            updateObject["content"] = content
            updateObject.ACL = PFACL(user: PFUser.currentUser()!)
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            
        }
        
        var alert = UIAlertView(title: "Success", message: "Thank you for your comment.", delegate: self, cancelButtonTitle: "OK")
        alert.show()
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
