//
//  SearchHomeViewController+TableView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

extension SearchHomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentSearchTableViewCell.identifier, for: indexPath) as! RecentSearchTableViewCell
        cell.removeCell = { [weak self] _ in
            guard let self else { return }
            self.recentSearchList.remove(at: indexPath.row)
        }
        cell.configureData(text: recentSearchList[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedKeyword = recentSearchList[indexPath.row]
        
        if !isOnlyWhitespace(selectedKeyword) {
            insertKeywordInSearchList(keyword: selectedKeyword)
            pushToSearchResultPage(searchKeyword: selectedKeyword)
        }
    }
}
