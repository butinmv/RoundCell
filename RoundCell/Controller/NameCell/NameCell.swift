//
//  NameCell.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {

    static var reuseId = "\(NameCell.self)"
    
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var separateLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(name: String?) {
        nameLabel.text = name
    }
}
