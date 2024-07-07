//
//  SearchResultViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import Toast
import RealmSwift

final class SearchResultViewController: UIViewController {
    // MARK: - UI
    let viewManager = SearchResultView()
    lazy var sortButtonList = viewManager.sortBUttonStackView.arrangedSubviews as! [OutlineBorderButton]
    
    // MARK: - Properties
    var searchKeyword : String? //이전 페이지에서 받는 데이터
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
    var searchResult : SearchResult? {
        didSet{
            viewManager.totalLabel.text = searchResult?.totalLabelText
            viewManager.searchResultCollectionView.reloadData()
        }
    }
    
    let repository = RealmDBRepository()  //realm
    var likeProductList : Results<ProductTable>! //realm
    
    
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
        setupDelegate()
        
//        repository.checkFileURL()
        let value = repository.getAllObjects(tableModel: ProductTable.self)
        likeProductList = value
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewManager.searchResultCollectionView.reloadData()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.searchResultCollectionView.dataSource = self
        viewManager.searchResultCollectionView.delegate = self
        viewManager.searchResultCollectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        
        viewManager.searchResultCollectionView.prefetchDataSource = self
        
    }
    
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
        
        page = 1
        getSearchResult()
        
    }

    // MARK: - APIFetch
    func getSearchResult() {
        guard let searchKeyword else {return }
        APIFetcher().getSearchResult(keyword: searchKeyword, page: page, sort: sort, displayAmount: displayAmount){ [weak self] data, errorMessage in
            guard let self else{return }
            
            if let errorMessage {
//                DispatchQueue.main.async {
                    self.view.makeToast(errorMessage, duration: 3.0, position: .top)
//                }
            }
            
            guard let data else {return }
            if page == 1{ ///처음 데이터 불러올 때 & 정렬 버튼 누를 때
                self.searchResult = data
                if !self.searchResult!.items.isEmpty {
                    self.viewManager.searchResultCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
                }
            }else {
                self.searchResult?.items.append(contentsOf: data.items)
            }
        }
    }
    
    
    // MARK: - PageTransition
    func pushToItemDetailPage(isLiked : Bool, product : SearchResultItem) {
        let vc = ItemDetailViewController()
        vc.isLiked = isLiked
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
}
