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
    // Container to store the view table selected object var currentObject : PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        
        var currentObject : PFObject?
        
        if var object = currentObject {
           titlefld.text = object["title"] as! String
            commentfld.text = object["content"] as! String
        }
        
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
        
        if let currentObject = PFObject?() {
            
            // Update the existing parse object
            currentObject["title"] = title
            currentObject["content"] = content
            currentObject.saveEventually()
            
        } else {
            
            // Create a new parse object
            var currentObject = PFObject(className:"Comment")
            
            currentObject["title"] = title
            currentObject["content"] = content
            currentObject.ACL = PFACL(user: PFUser.currentUser()!)
            
            // Save the data back to the server in a background task
            currentObject.saveEventually()
            
        }
        
        var alert = UIAlertView(title: "Success", message: "Thank you for your comment.", delegate: self, cancelButtonTitle: "OK")
        alert.show()
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
