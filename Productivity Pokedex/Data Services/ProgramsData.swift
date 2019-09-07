//
//  TaskData.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 2/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import Foundation

class ProgramsData {
    
    static let shared = ProgramsData()
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Programs.json")
    
    var programs = [Program]()
    
    
    
    init() {
        
        loadDataFromJSON()
    }
    
    private func loadDataFromJSON() {
        
        if let data = try? Data(contentsOf: path) {
            decode(data: data)
        } else {
            let url = Bundle.main.url(forResource: "Programs", withExtension: "json")!
            if let data = try? Data(contentsOf: url) {
                decode(data: data)
            }
        }
        
    }
    
    private func decode(data: Data) {
        if let programs = try? JSONDecoder().decode([Program].self, from: data) {
            self.programs = programs
        }
    }
    
    
}
