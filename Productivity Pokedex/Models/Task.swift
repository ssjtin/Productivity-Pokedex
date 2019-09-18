//
//  Task.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 5/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//
//  Single task for user to complete

struct Task: Codable {
    
    let description: String
    let value: Int
    let type: TaskType
    let attackPower: Int
    
    enum ItemKeys: String, CodingKey {
        case description = "description"
        case value = "value"
        case type = "type"
        case attackPower = "attackPower"
    }
    
    init(description: String, value: Int, type: TaskType, attackPower: Int) {
        self.description = description
        self.value = value
        self.type = type
        self.attackPower = attackPower
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ItemKeys.self)
        try container.encode(description, forKey: .description)
        try container.encode(value, forKey: .value)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(attackPower, forKey: .attackPower)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemKeys.self)
        let description: String = try container.decode(String.self, forKey: .description)
        let value: Int = try container.decode(Int.self, forKey: .value)
        let typeRawValue: String = try container.decode(String.self, forKey: .type)
        let type: TaskType = TaskType(rawValue: typeRawValue)!
        let attackPower: Int = try container.decode(Int.self, forKey: .attackPower)
        
        self.init(description: description, value: value, type: type, attackPower: attackPower)
    }
}
