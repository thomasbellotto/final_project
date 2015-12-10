//
//  ViewController.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-09.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    var logInViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {

        super.viewDidAppear(animated)
        
        if(PFUser.currentUser() == nil){
            
            self.logInViewController.fields = [.UsernameAndPassword, .LogInButton, .SignUpButton, .PasswordForgotten, .DismissButton]
            
            let logInLogoTitle = UILabel()
            logInLogoTitle.text = "Parse iOS Log IN"
            self.logInViewController.logInView!.logo = logInLogoTitle
            self.logInViewController.delegate = self
            
            
            let signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "Parse iOS Sign UP"
            self.signUpViewController.signUpView!.logo = signUpLogoTitle
            self.logInViewController.signUpController = self.signUpViewController
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /************** Parse Login ******************/
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        if(!username.isEmpty || !password.isEmpty){
            return true
        } else {
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("Fail to Log in")
    }
    
    /************* Parse Sign Up *****************/
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Fail to Sign Up")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        print("User dismissed sign up.")
        
    }
    
    /************ Actions *********************/
    
    /*@IBAction func logoutAction(sender: AnyObject) {
        PFUser.logOut()
    }*/

}

