//
//  DetailViewController.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-18.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {

    @IBOutlet weak var titlefld: UITextField!
    @IBOutlet weak var contentfld: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if var currentObject = PFObject?() {
            titlefld.text = currentObject["title"] as! String
            contentfld.text = currentObject["content"] as! String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little 
    preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
