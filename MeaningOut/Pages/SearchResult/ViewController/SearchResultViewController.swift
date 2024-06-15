//
//  SearchResultViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit

final class SearchResultViewController: UIViewController {
    // MARK: - UI
    let viewManager = SearchResultView()
    
    // MARK: - Properties
    var searchKeyword : String?
    var page = 1
    var sort = "sim"
    let displayAmount = 30
    var searchResult : SearchResult?
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = searchKeyword
        
        configureNavigationBackButtonItem()
        getSearchResult()
    
    }

    // MARK: - SetupDelegate
    // MARK: - AddTarget
    private func setupAddTarget() {
    }
    // MARK: - EventSelector

    // MARK: - APIFetch
    private func getSearchResult() {
        guard let searchKeyword else {return }
        APIFetcher().getSearchResult(keyword: searchKeyword, page: page, sort: sort, displayAmount: displayAmount){ [weak self] data in
            guard let self else{return }
            self.searchResult = data
            
            print("--🧡🧡🧡searchResult--",searchResult)
        }
    }
    
    
    // MARK: - PageTransition

}
