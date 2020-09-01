//
//  Section.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import Foundation

enum Section: CustomStringConvertible, CaseIterable {
    
    case mainSettings
    case names
    case settings
    
    var description: String {
        switch self {
        case .mainSettings: return "Main settings"
        case .names: return "Names"
        case .settings: return "Settings"
        }
    }

    static func nemberOfSections() -> Int {
        return self.allCases.count
    }
    
    static func getSection(_ section: Int) -> Section {
        return self.allCases[section]
    }
}
