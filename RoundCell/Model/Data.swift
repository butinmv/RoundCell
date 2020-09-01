//
//  Data.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation


struct Data {
    static func all() -> [Section: [String]] {
        [
            Section.mainSettings: ["Param1", "Param2", "Param3"],
            Section.names: ["Maxim", "Andrew", "Ivan", "Alex", "John", "Bob", "Roy", "Daniel", "Thor", "Anthony", "James", "Koby", "Rondo", "Michael", "Derick", "Denis", "Yanix"],
            Section.settings: ["Setting 1", "Setting 2", "Setting 3", "Setting 4", "Setting 5", "Setting 6", "Setting 7", "Setting 8"]
        ]
    }
    
    static func turnOnSettings() -> [String] {
        ["Param1", "Setting 2", "Setting 5", "Setting 8"]
    }
}
