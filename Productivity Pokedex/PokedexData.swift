//
//  PokedexDataRetriever.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

enum Location: String {
    case PalletTown = "Pallet Town"
    case ViridianForest = "Viridian Forest"
}

class PokedexData {
    
    static let shared = PokedexData()
    
    var pokemon = [Pokemon]()
    
    init() {
        
        pokemon.append(Pokemon(name: "Bulbasaur", id: 1, imageName: "bulbasaur", baseHP: 22, captured: false, evolutionId: 2, location: .PalletTown))
        pokemon.append(Pokemon(name: "Charmander", id: 4, imageName: "charmander", baseHP: 24, captured: false, evolutionId: 5, location: .PalletTown))
        pokemon.append(Pokemon(name: "Caterpie", id: 10, imageName: "caterpie", baseHP: 23, captured: false, evolutionId: 11, location: .ViridianForest))
    }
    
}
