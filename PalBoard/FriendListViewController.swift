//
//  ViewController.swift
//  PalBoard
//
//  Created by Jeong Kim on 4/12/16.
//  Copyright © 2016 Josh Kim. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createFriends()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func createFriends(){
        
        let washington = Friend()
        washington.name = "Washington"
        washington.phoneNumber = "646-675-5625"
        washington.birthday = "February 22nd"
        washington.picture = UIImage(named: "geowash")!
        self.friends.append(washington)
        
        let adams = Friend()
        adams.name = "Adams"
        adams.phoneNumber = "646-675-5625"
        adams.birthday = "October 30th"
        adams.picture = UIImage(named: "johnadams")!
        self.friends.append(adams)
        
        let jefferson = Friend()
        jefferson.name = "Jefferson"
        jefferson.phoneNumber = "646-675-5625"
        jefferson.birthday = "April 13th"
        jefferson.picture = UIImage(named: "tommyjeffs")!
        self.friends.append(jefferson)
        
        let madison = Friend()
        madison.name = "Madison"
        madison.phoneNumber = "646-675-5625"
        madison.birthday = "March 16th"
        madison.picture = UIImage(named: "jimmymad")!
        self.friends.append(madison)
        
        let lincoln = Friend()
        lincoln.name = "Lincoln"
        lincoln.phoneNumber = "646-675-5625"
        lincoln.birthday = "February 12th"
        lincoln.picture = UIImage(named: "honestabe")!
        self.friends.append(lincoln)
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.friends.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
        
    }



}

