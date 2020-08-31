//
//  RoundCorners.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

struct RoundCorners: OptionSet {
    let rawValue: Int
    
    static let topLeft = RoundCorners(rawValue: 1 << 0)
    static let topRight = RoundCorners(rawValue: 1 << 1)
    static let bottomLeft = RoundCorners(rawValue: 1 << 2)
    static let bottomRight = RoundCorners(rawValue: 1 << 3)
    
    static let top: RoundCorners = [.topLeft, .topRight]
    static let bottom: RoundCorners = [.bottomLeft, .bottomRight]
    static let left: RoundCorners = [.topLeft, .bottomLeft]
    static let right: RoundCorners = [.topRight, .bottomRight]
    static let all: RoundCorners = [.topLeft, .topRight, .bottomLeft, .bottomRight]
}
