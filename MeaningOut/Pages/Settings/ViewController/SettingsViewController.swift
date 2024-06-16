//
//  SettingsViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - UI
    let viewManager = SettingsView()
    
    // MARK: - Properties
    static let settingsCellIdentifier = "SettingsCell"
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = PageTitle.Settings
        configureBackgroundColor()
        setupDelegate()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.settingsTableView.dataSource = self
        viewManager.settingsTableView.delegate = self
        viewManager.settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingsViewController.settingsCellIdentifier)
    }
    
    // MARK: - AddTarget
    private func setupAddTarget() {
    }
    // MARK: - EventSelector
    // MARK: - SetupUI
    // MARK: - APIFetch
    // MARK: - PageTransition

}

extension SettingsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsViewController.settingsCellIdentifier)!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.row].rawValue
        return cell
    }
}

//프로필 영역의 부모뷰인 뷰를 만들고
//거기다가 tapGesture 추가해서 프로필 수정 페이지로 넘어갈 수 있도록


