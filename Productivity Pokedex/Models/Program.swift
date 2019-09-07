//
//  Category.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 5/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

//  Category or topic of things we want to train, i.e. Meditate, Read
//  For now almost synonymous with Task, later can hold reference to several similar items
//  Returns Task item for user to complete

struct Program: Codable {
    
    let title: String
    let tasks: [Task]
    var selected: Bool
    var completionCount: Int
    
    enum ItemKeys: String, CodingKey {
        case title = "title"
        case tasks = "tasks"
        case selected = "selected"
        case completionCount = "completionCount"
    }
    
    init(title: String, tasks: [Task], selected: Bool, completionCount: Int) {
        self.title = title
        self.tasks = tasks
        self.selected = selected
        self.completionCount = completionCount
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ItemKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(tasks, forKey: .tasks)
        try container.encode(selected, forKey: .selected)
        try container.encode(completionCount, forKey: .completionCount)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemKeys.self)
        
        let title: String = try container.decode(String.self, forKey: .title)
        let tasks: [Task] = try container.decode([Task].self, forKey: .tasks)
        let selected: Bool = try container.decode(Bool.self, forKey: .selected)
        let completionCount: Int = try container.decode(Int.self, forKey: .completionCount)
        
        self.init(title: title, tasks: tasks, selected: selected, completionCount: completionCount)
    }
    
    
    func randomTask() -> Task {
        guard let randomTask = tasks.randomElement() else { fatalError() }
        return randomTask
    }
}
