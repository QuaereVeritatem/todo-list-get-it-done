//
//  TodoList.swift
//  Todo_list_Get_It_Done
//
//  Created by Robert Martin on 7/5/16.
//  Copyright © 2016 Robert Martin. All rights reserved.
//

import Foundation
class TodoList {
    static let sharedInstance = TodoList()
        var taskList: [String] = ["laundry", "walk the dog", "Cook", "clean bathroom", "fold clothes",
                                  "workout", "wash the dishes", "Take out the trash", "Empty dishwasher", "Take a shower", "meditate"]
}

