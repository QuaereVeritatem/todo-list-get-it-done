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
    //var taskList: [String] = ["laundry", "walk the dog", "Cook", "clean bathroom"]
    let myTasks: String = ""
    var tempTask: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //removes seperators between cells
        tableView.separatorStyle = .None
        //makes it so background is black (so when you swipe cells underneath is black)
        tableView.backgroundColor = UIColor.blackColor()
        tableView.rowHeight = 50.0

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
    print (TodoList.sharedInstance.taskList.count)
    return TodoList.sharedInstance.taskList.count
}

// From UITableViewDataSource protocol.
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    //print("Building a UITableViewCell for \(indexPath.row)")
    
    // Our Custom Cell. (reuses cell memory of cell leaving off screen instead of using new memory
    let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as UITableViewCell
    //gets rid of highlighting when you select a cell
    cell.selectionStyle = .None
    
    cell.textLabel?.text = TodoList.sharedInstance.taskList[indexPath.row]
  
    return cell
}

// From UITableViewDelegate protocol.
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    print("User selected section: \(indexPath.section), row: \(indexPath.row)")
}
   
    //gradient function
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = TodoList.sharedInstance.taskList.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
    //function takes gradient and applys to table (table as a whole NOT individual cells)
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                   forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
}