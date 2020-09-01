//
//  SettingsCell.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

protocol SettingsCellDelegate: class {
    func didChangeValue(_ cell: SettingsCell, _ setting: String)
}

class SettingsCell: BasicCell {

    static var reuseId = "\(SettingsCell.self)"
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    // Callback Method
    var callBack: (() -> ())?
    
    // Delegate Method
    var delegate: SettingsCellDelegate?
    var setting: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(setting: String?, settings: [String]) {
        settingLabel.text = setting
        guard let setting = setting else { return }
        switcher.isOn = settings.contains(setting) ? true : false
    }
    
    @IBAction func toogle(_ sender: UISwitch) {
//        callBack?()
        guard let setting = setting, let delegate = delegate else { return }
        delegate.didChangeValue(self, setting)
        
    }
}
