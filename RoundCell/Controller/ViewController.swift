//
//  ViewController.swift
//  RoundCell
//
//  Created by Maxim Butin on 31.08.2020.
//  Copyright © 2020 Maxim Butin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let items = Data.all()
    var settings = Data.turnOnSettings()
    
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
    
    fileprivate func switchCallBack(_ cell: SettingsCell, _ setting: String?) {
        cell.callBack = { [weak self] in
            guard let setting = setting else { return }
            if cell.switcher.isOn {
                self?.settings.append(setting)
            } else {
                guard let index = self?.settings.firstIndex(of: setting) else { return }
                self?.settings.remove(at: index)
            }
            
            print(self?.settings.sorted())
        }
    }
    
    fileprivate func designCell(_ indexPath: IndexPath, _ cell: BasicCell, _ tableView: UITableView) {
        switch indexPath.row {
        case 0:
            cell.roundView.roundCorners(corners: [.top])
            cell.separateLine.isHidden = false
        case tableView.numberOfRows(inSection: indexPath.section) - 1:
            cell.roundView.roundCorners(corners: [.bottom])
            cell.separateLine.isHidden = true
        default:
            cell.roundView.roundCorners(corners: [], radius: 0)
            cell.separateLine.isHidden = false
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section.getSection(indexPath.section)
        switch section {
        case .mainSettings, .settings:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseId) as? SettingsCell else {
                fatalError("Not found \(SettingsCell.self)")
            }
            let setting = items[section]?[indexPath.row]
            cell.update(setting: setting, settings: settings)
            cell.setting = setting
            cell.delegate = self
//            switchCallBack(cell, setting)
            designCell(indexPath, cell, tableView)
            return cell
        case .names:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NameCell.reuseId) as? NameCell else {
                fatalError("Not found \(NameCell.self)")
            }
            let name = items[section]?[indexPath.row]
            cell.update(name: name)
            designCell(indexPath, cell, tableView)
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

extension ViewController: SettingsCellDelegate {
    func didChangeValue(_ cell: SettingsCell, _ setting: String) {
        if cell.switcher.isOn {
            settings.append(setting)
        } else {
            guard let index = settings.firstIndex(of: setting) else { return }
            settings.remove(at: index)
        }
        
        print(settings.sorted())
    }
}
