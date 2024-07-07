//
//  SettingsViewController+TableView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/17/24.
//

import UIKit

extension SettingsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTrailingLabelTableViewCell.identifier) as! CustomTrailingLabelTableViewCell
        let rowData = SettingOptions.allCases[indexPath.row]
        cell.textLabel?.text = rowData.rawValue
        cell.configureTrailingView(option: rowData, likeAmount: likeProductList.count)
        
        if indexPath.row <= 3 {
            cell.selectionStyle = .none
        } else {
            cell.selectionStyle = .default
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = SettingOptions.allCases[indexPath.row]
        if rowData == .userWithdrawal {
            userWithdrawalCellTapped()
        }
    }
}
