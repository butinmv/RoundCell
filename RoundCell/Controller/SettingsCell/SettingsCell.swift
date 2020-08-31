//
//  SettingsCell.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    static var reuseId = "\(SettingsCell.self)"
    
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var separateLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(setting: String?) {
        settingLabel.text = setting
    }
    
}
