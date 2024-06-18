//
//  SearchHomeViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

final class SearchHomeViewController: UIViewController {
    // MARK: - UI
    let viewManager = SearchHomeView()
    
    // MARK: - Properties
    var recentSearchList : [String] = [] {
        didSet {
            print("❤️❤️❤️recentSearchList -- didSet", recentSearchList)
            //요소 하나도 없으면 isEmpty 빈 화면
            viewManager.emptyView.isHidden = !recentSearchList.isEmpty
            
            //유저디폴트에 저장
            UserDefaults.standard.searchList = recentSearchList
            
            //테이블뷰 리로드
            viewManager.recentSearchTableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sestupNavigation()
        configureBackgroundColor()
        setupRecentSearchList()
        setupDelegate()
        setupAddTarget()
        hideKeyboardWhenTappedAround()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sestupNavigation()
    }
    
    // MARK: - SetupNavigation
    private func sestupNavigation() {
        let nickname = UserDefaults.standard.nickname
        navigationItem.title = PageTitle.searchMain(nickname: nickname ?? "-")
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.searchBar.delegate = self
        
        viewManager.recentSearchTableView.dataSource = self
        viewManager.recentSearchTableView.delegate = self
        viewManager.recentSearchTableView.register(RecentSearchTableViewCell.self, forCellReuseIdentifier: RecentSearchTableViewCell.identifier)
    }
    
    // MARK: - AddTarget
    private func setupAddTarget() {
        viewManager.deleteAllButton.addTarget(self, action: #selector(removeAllButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - EventSelector
    @objc private func removeAllButtonTapped() {
        recentSearchList = []
    }
    
    // MARK: - PageTransition
    func pushToSearchResultPage(searchKeyword : String) {
        let vc = SearchResultViewController()
        vc.searchKeyword = searchKeyword
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Method
    private func setupRecentSearchList() {
        if let list = UserDefaults.standard.searchList{
            recentSearchList = list
        }

    }
    
    func insertKeywordInSearchList(keyword : String){
        if let index = recentSearchList.firstIndex(where: { $0 == keyword }) {
            //중복된 검색어면
            recentSearchList.remove(at: index)
        }
        recentSearchList.insert(keyword, at: 0)
    }
}

extension SearchHomeViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {return }
        
        if !isOnlyWhitespace(text) {
            insertKeywordInSearchList(keyword: text)
            pushToSearchResultPage(searchKeyword : text)
        }

    }
}
