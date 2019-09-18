//
//  TaskListConstructor.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 2/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

class TaskConstructor {
    
    let taskData = ProgramsData.shared
    
    func createAttackList(difficulty: TaskLevel) -> [Task] {
        var tasks = [Task]()
        
        while tasks.count < 4 {
            guard let category = taskData.programs.randomElement() else { fatalError("No categories to construct tasks") }
            tasks.append(category.randomTask())
        }
        
        return tasks
    }
    
    func randomAttack() -> Task {
        return taskData.programs.randomElement()!.tasks.randomElement()!
    }
    
}
