//
//  UIView-Extension.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

extension UIView {
    var topLeft:     CACornerMask { return .layerMinXMinYCorner }
    var topRight:    CACornerMask { return .layerMaxXMinYCorner }
    var bottomLeft:  CACornerMask { return .layerMinXMaxYCorner }
    var bottomRight: CACornerMask { return .layerMaxXMaxYCorner }
    
    func roundCorners(corners: RoundCorners, radius: CGFloat? = 8.0) {
        
        var maskedCorners: CACornerMask = []
        
        if corners.contains(.topLeft) {
            maskedCorners.update(with: topLeft)
        }

        if corners.contains(.topRight) {
            maskedCorners.update(with: topRight)
        }

        if corners.contains(.bottomLeft) {
            maskedCorners.update(with: bottomLeft)
        }

        if corners.contains(.bottomRight) {
            maskedCorners.update(with: bottomRight)
        }
        
        clipsToBounds = true
        layer.cornerRadius = radius ?? 8.0
        layer.maskedCorners = maskedCorners
    }
}
