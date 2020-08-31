//
//  ViewController.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let items: [Section: [String]] = Data.all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(
            UINib(nibName: NameCell.reuseId, bundle: nil),
            forCellReuseIdentifier: NameCell.reuseId
        )
        
        tableView.register(
            UINib(nibName: SettingsCell.reuseId, bundle: nil),
            forCellReuseIdentifier: SettingsCell.reuseId
        )
        
    }
}

// MARK: - UITableViewController Data Source
extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.nemberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Section.getSection(section)
        return items[section]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section.getSection(indexPath.section)
        switch section {
        case .names:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NameCell.reuseId) as? NameCell else {
                fatalError("Not found \(NameCell.self)")
            }
            let name = items[section]?[indexPath.row]
            cell.update(name: name)
            
            switch indexPath.row {
            case 0:
                cell.roundView.roundCorners(corners: [.top])
            case tableView.numberOfRows(inSection: indexPath.section) - 1:
                cell.roundView.roundCorners(corners: [.bottom])
                cell.separateLine.isHidden = true
            default:
                cell.roundView.roundCorners(corners: [], radius: 0)
            }
            
            return cell
        case .settings:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseId) as? SettingsCell else {
                fatalError("Not found \(SettingsCell.self)")
            }
            let setting = items[section]?[indexPath.row]
            cell.update(setting: setting)
            
            switch indexPath.row {
            case 0:
                cell.roundView.roundCorners(corners: [.top])
            case tableView.numberOfRows(inSection: indexPath.section) - 1:
                cell.roundView.roundCorners(corners: [.bottom])
                cell.separateLine.isHidden = true
            default:
                cell.roundView.roundCorners(corners: [], radius: 0)
            }
            
            return cell
        }
    }
    
}

// MARK: - UITableViewController Delegate
extension ViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = Section.getSection(section)
        return section.description
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
}

