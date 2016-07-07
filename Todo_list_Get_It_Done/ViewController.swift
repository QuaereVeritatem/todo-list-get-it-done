//
//  ViewController.swift
//  Todo_list_Get_It_Done
//
//  Created by Robert Martin on 6/29/16.
//  Copyright © 2016 Robert Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addTaskLabel: UITextField!
    
   
    
    @IBAction func submitTaskButton(sender: AnyObject) {
        //let addTaskLabel.text = taskList[].append()
        performSegueWithIdentifier("My Segue", sender: nil)
    }
    //var taskList: [String] = ["laundry", "walk the dog", "Cook", "clean bathroom"]
    //var tempTask: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    // UITextFieldDelegate
    
    // Method gets called when the textfield editing will start
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        print("textFieldShouldBeginEditing")
        
        return true
    }
    
    // Method gets called when the textfield editing started already
    func textFieldDidBeginEditing(textField: UITextField) {
        
        print("textFieldDidBeginEditing")
    }
    
    // Method gets called when the textfield editing will end
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        print("textFieldShouldEndEditing")
        
        return true
    }
    
    // Method gets called when typing every single character (or whole words if the user selects an auto completion)
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        print("textField:shouldChangeCharactersInRange = \(string)")
        
        return true
    }
    
    // Method gets called when the textfield editing ended already
    func textFieldDidEndEditing(textField: UITextField) {
        
        print("textFieldDidEndEditing")
    }
    
    // Method gets called when the keyboard return key pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        
        addTaskLabel.resignFirstResponder()
        
        return true
    }
    
    
    // We can override this method in UIViewController if we want to perform some
    // logic before a Segue actually fires off.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "My Segue" {
            
            print("Preparing for My Segue!")
           
            //TaskViewController is a class of UITableViewController...
            //the destination is a UIViewController
           //let secondVC = segue.destinationViewController as! TaskViewController
            
            // Pass some data to the next View Controller by setting one or more of
            // its properties.
            //secondVC.taskList.append(addTaskLabel.text!)
            
            //a singleton class that stores the data and then allows the viewcontrollers to acces it
            TodoList.sharedInstance.taskList.append(addTaskLabel.text!)
    }


}

}