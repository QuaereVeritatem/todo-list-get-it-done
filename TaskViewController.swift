//
//  TaskViewController.swift
//  Todo_list_Get_It_Done
//
//  Created by Robert Martin on 7/1/16.
//  Copyright © 2016 Robert Martin. All rights reserved.
//

import Foundation
import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var taskList: [String] = ["laundry", "walk the dog", "Cook", "clean bathroom"]
    let myTasks: String = ""
    var tempTask: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // ViewController taskList.append(myTasks)
        tableView.reloadData()
        // Once the view loads, use the String value stored in textData to
        // to set the view's label text as proof that we actually got the
        // data passed to us from the other view controller.
        
   //     TaskViewController.textLabel?.text = taskList[]
        //
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


// From UITableViewDataSource protocol.
func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1;
}

// From UITableViewDataSource protocol.  //myData should be called taskList
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print (taskList.count)
    return taskList.count
}

// From UITableViewDataSource protocol.
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    //print("Building a UITableViewCell for \(indexPath.row)")
    
    // Our Custom Cell.
    let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as UITableViewCell
    
    cell.textLabel?.text = taskList[indexPath.row]
    
    return cell
}

// From UITableViewDelegate protocol.
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    print("User selected section: \(indexPath.section), row: \(indexPath.row)")
    
    
}

}