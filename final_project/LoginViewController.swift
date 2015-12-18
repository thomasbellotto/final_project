//
//  LoginViewController.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-10.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
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
    
    @IBAction func loginAction(sender: AnyObject) {
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        if (username!.utf16.count < 4 || password!.utf16.count < 5) {
            
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater then 4 and Password must be greater then 5", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        }else {
            
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if ((user) != nil) {
                    
                    var alert = UIAlertView(title: "Success", message: "Welcome. You have logged in.", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.performSegueWithIdentifier("forum", sender: self)
                    
                }else {
                    
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                
            })
            
        }
        
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signUp", sender: self)
        
    }


}
