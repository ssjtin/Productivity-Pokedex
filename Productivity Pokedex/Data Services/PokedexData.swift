//
//  PokedexDataRetriever.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import Foundation

enum Location: String {
    case PalletTown = "Pallet Town"
    case ViridianForest = "Viridian Forest"
}

class PokedexData {
    
    static let shared = PokedexData()
    
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Pokedex.json")
    
    var pokemonDictionary = [Int: Pokemon]()
    
    init() {
        
        loadDataFromJSON()
    }
    
    private func loadDataFromJSON() {
        
        //  read from Bundle json
//        let url = Bundle.main.url(forResource: "Pokedex", withExtension: "json")!
//        if let data = try? Data(contentsOf: url) {
//            if let pokemonDictionary = try? JSONDecoder().decode([Int: Pokemon].self, from: data) {
//                self.pokemonDictionary = pokemonDictionary
//                print(pokemonDictionary)
//            }
//        }
  
        if let data = try? Data(contentsOf: path) {
            //Initial json data has been copied to .documentsDirectory
            decode(data: data)
        } else {
            //Initial copy data from json from Bundle to .documentsDirectory
            let url = Bundle.main.url(forResource: "Pokedex", withExtension: "json")!
            if let data = try? Data(contentsOf: url) {
                try? data.write(to: path)   //Copy data over to bundle plist

                decode(data: data)
            }

        }
        
    }
    
    private func decode(data: Data) {
        if let pokemonDictionary = try? JSONDecoder().decode([Int: Pokemon].self, from: data) {
            self.pokemonDictionary = pokemonDictionary
        }
    }
    
    func randomPokemon(at location: Location) -> Pokemon? {
        
        //Filter pokedex by uncaught pokemon available at location
        
        let possiblePokemon = pokemonDictionary.values.filter { $0.captured == false && $0.location == location }
        
        guard !possiblePokemon.isEmpty else {
            print("no pokemon available at this location")
            return nil
        }
        
        return possiblePokemon.randomElement()
    }
    
    func didCatchPokemon(withId id: Int) {

        //  Update pokemonDictionary entry to captured
        
        pokemonDictionary[id]?.captured = true

        do {
            let data = try JSONEncoder().encode(pokemonDictionary)
            try data.write(to: path)
        } catch let err {
            print(err.localizedDescription)
        }
    
    }
    
}
