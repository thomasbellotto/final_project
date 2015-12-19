//
//  commentViewController.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-17.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class commentViewController: UIViewController {

    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    @IBOutlet weak var titlecomment: UITextView!
    @IBOutlet weak var commentcomnt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        
        if var currentObject = PFObject?() {
            titlecomment.text = currentObject["title"] as! String
            commentcomnt.text = currentObject["content"] as! String
            
            currentObject.saveEventually()
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
    
    
    

}
