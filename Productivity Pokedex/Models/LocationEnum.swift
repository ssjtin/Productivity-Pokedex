//
//  LocationEnum.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 5/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//
//  enumeration for map areas

enum Location: Int {
    
    case unknown = 0, PalletTown, ViridianForest
    
    var imageName: String {
        let imageNames = [
            "unown-location",
            "pallet-town",
            "viridian-forest"
        ]
        return imageNames[rawValue]
    }
    
    var nameString: String {
        let cityNames = [
            "Map coming soon",
            "Pallet Town",
            "Viridian Forest"
        ]
        return cityNames[rawValue]
    }
    
}
