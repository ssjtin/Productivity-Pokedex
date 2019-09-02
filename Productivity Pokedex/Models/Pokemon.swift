//
//  Pokemon.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

struct Pokemon {
    
    let name: String
    let id: Int
    let imageName: String
    let baseHP: Int
    var captured: Bool
    let evolutionId: Int        //id of pokemon to evolve to
    let location: Location        //can be obtained from this map
    
}

extension Pokemon: Comparable {
    static func < (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id < rhs.id
    }
}
