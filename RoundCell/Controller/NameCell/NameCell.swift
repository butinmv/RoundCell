//
//  NameCell.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {
    @IBOutlet weak var separateLine: UIView!
    @IBOutlet weak var roundView: UIView!
}

class NameCell: BasicCell {

    static var reuseId = "\(NameCell.self)"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(name: String?) {
        nameLabel.text = name
    }
}
