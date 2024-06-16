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
    lazy var sortButtonList = [viewManager.simSortButton, viewManager.dateSortButton, viewManager.ascSortButton, viewManager.dscSortButton]
    
    // MARK: - Properties
    var searchKeyword : String?
    var page = 1
    var sort : String {
        get {
            ///isSelected가 true인 버튼을 찾아서
            let index = sortButtonList.firstIndex{
                $0.isSelected == true
            }
            
            guard let index else {return ""}
            /// 그 버튼의 .titleLabel?.text 와 Sort에서의 sortText와 일치하는 것을 찾아 rawValue 추출
            let selectedSortText = sortButtonList[index].titleLabel?.text
            let resultSortRawValue = Sort.allCases.first{
                $0.sortText == selectedSortText
            }?.rawValue
            
            guard let resultSortRawValue else {return ""}
            return resultSortRawValue
        }
    }
    
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
        configureBackgroundColor()
        getSearchResult()
        setupAddTarget()
    
    }

    // MARK: - SetupDelegate
    // MARK: - AddTarget
    private func setupAddTarget() {
        sortButtonList
            .forEach{
                $0.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
            }

        
    }
    // MARK: - EventSelector
    @objc func sortButtonTapped(sender : OutlineBorderButton) {
        
        sortButtonList
            .forEach{
                if sender == $0 {
                    $0.isSelected = true
                }else {
                    $0.isSelected = false
                }
            }
        

        getSearchResult()
        
    }

    // MARK: - APIFetch
    private func getSearchResult() {
        guard let searchKeyword else {return }
        APIFetcher().getSearchResult(keyword: searchKeyword, page: page, sort: sort, displayAmount: displayAmount){ [weak self] data in
            guard let self else{return }
            self.searchResult = data
            
//            print("--🧡🧡🧡searchResult--",searchResult)
        }
    }
    
    
    // MARK: - PageTransition

}
