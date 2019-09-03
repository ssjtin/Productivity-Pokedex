//
//  TaskData.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 2/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

class TaskData {
    
    static let shared = TaskData()
    
    var categories = [Category]()
    
    init() {
        //Fetch data from plist
        
        // Hardcode Categories - TODO: Retrieve from plist
        let meditate = Category(title: "Meditate", type: .Timed, values: [.Easy: 5, .Normal: 10, .Hard: 15], completionCount: 0)
        let read = Category(title: "Read", type: .Timed, values: [.Easy: 20, .Normal: 40, .Hard: 60], completionCount: 0)
        let pushups = Category(title: "Pushups", type: .Count, values: [.Easy: 30, .Normal: 60, .Hard: 100], completionCount: 0)
        let fast = Category(title: "Fast until 12pm", type: .Count, values: nil, completionCount: 0)
        
        categories.append(contentsOf: [meditate, read, pushups, fast])
    }
}
