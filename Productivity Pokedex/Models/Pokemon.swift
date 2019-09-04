//
//  Pokemon.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

struct Pokemon: Codable {
    
    let name: String
    let id: Int
    let imageName: String
    let baseHP: Int
    var captured: Bool
    let evolutionId: Int        //id of pokemon to evolve to
    let location: Location        //can be obtained from this map
    
    enum ItemKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case imageName = "imageName"
        case baseHP = "baseHP"
        case captured = "captured"
        case evolutionId = "evolutionId"
        case location = "location"
    }
    
    init(name: String, id: Int, imageName: String, baseHP: Int, captured: Bool, evolutionId: Int, location: Location) {
        self.name = name
        self.id = id
        self.imageName = imageName
        self.baseHP = baseHP
        self.captured = captured
        self.evolutionId = evolutionId
        self.location = location
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ItemKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(imageName, forKey: .imageName)
        try container.encode(baseHP, forKey: .baseHP)
        try container.encode(captured, forKey: .captured)
        try container.encode(evolutionId, forKey: .evolutionId)
        try container.encode(location.rawValue, forKey: .location)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemKeys.self)
        
        let name: String = try container.decode(String.self, forKey: .name)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let imageName: String = try container.decode(String.self, forKey: .imageName)
        let baseHP: Int = try container.decode(Int.self, forKey: .baseHP)
        let captured: Bool = try container.decode(Bool.self, forKey: .captured)
        let evolutionId: Int = try container.decode(Int.self, forKey: .evolutionId)
        let location: Location = .ViridianForest
        
        self.init(name: name, id: id, imageName: imageName, baseHP: baseHP, captured: captured, evolutionId: evolutionId, location: location)
    }
    
}

extension Pokemon: Comparable {
    static func < (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id < rhs.id
    }
    
}
