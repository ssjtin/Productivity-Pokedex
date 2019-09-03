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
}

//Single task for user to complete
struct Task {
    let description: String
    let value: Int
    let type: TaskType
    let completed: Bool = false
}

//  Category or topic of things we want to train, i.e. Meditate, Read
//  For now almost synonymous with Task, later can hold reference to several similar items
//  Returns Task item for user to complete
struct Category {
    let title: String
    let type: TaskType
    let values: [TaskLevel: Int]?
    var completionCount: Int
    
    func randomTask(with level: TaskLevel) -> Task {
        //Attempt to set value for level, else set '1'
        if let values = values {
            if let value = values[level] {
                return Task(description: title, value: value, type: type)
            }
        }
        return Task(description: title, value: 1, type: type)
    }
}

class TaskConstructor {
    
    let taskData = TaskData.shared
    
    func createAttackList(difficulty: TaskLevel) -> [Task] {
        var tasks = [Task]()
        
        while tasks.count < 4 {
            guard let category = taskData.categories.randomElement() else { fatalError("No categories to construct tasks") }
            tasks.append(category.randomTask(with: difficulty))
        }
        
        return tasks
    }
    
    func randomAttack() -> Task {
        let randomCategory = taskData.categories.randomElement()!
        return randomCategory.randomTask(with: .Easy)
    }
    
}
