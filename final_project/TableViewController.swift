//
//  TableViewController.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-17.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TableViewController: PFQueryTableViewController {
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Comment"
        self.textKey = "title"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
    }
    
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "Comment")
        query.orderByAscending("title")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let title = object?["title"] as? String {
            cell?.textLabel?.text = title
        }
        
        return cell
    }
    
    @IBAction func signOut(sender: AnyObject) {
        
        PFUser.logOut()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
