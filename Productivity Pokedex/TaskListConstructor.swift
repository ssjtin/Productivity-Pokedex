//
//  TaskListConstructor.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 2/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import Foundation

//  Cases for difficulty of tasks
enum TaskLevel {
    case Easy
    case Normal
    case Hard
}

// Describes if the task has associated measure
enum TaskType {
    case Timed      //value of associated task refers to time in minutes
    case Count      //  '' refers to total count, i.e. 50 pushups
    case Static     //task has no count associated
}

struct Task {
    let description: String
    let value: Int?
    let type: TaskType
    let completed: Bool = false
}

class TaskListConstructor {
    
    func createAttackList(difficulty: TaskLevel) -> [Task] {
        var tasks = [Task]()
        
        let task1 = Task(description: "Meditate", value: 5, type: .Timed)
        let task2 = Task(description: "Do pushups", value: 100, type: .Count)
        let task3 = Task(description: "Study Coding", value: 120, type: .Timed)
        let task4 = Task(description: "Practise at driving range", value: nil, type: .Static)
        
        tasks.append(contentsOf: [task1, task2, task3, task4])
        
        return tasks
    }
    
    
}
