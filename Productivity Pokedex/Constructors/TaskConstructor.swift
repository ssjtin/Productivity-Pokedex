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
            tasks.append(randomAttack())
        }
        
        return tasks
    }
    
    func randomAttack() -> Task {
        guard let program = taskData.programs.randomElement() else {
            fatalError()
        }
        return program.randomTask()
    }
    
}
