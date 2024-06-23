//
//  ItemDetailViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import WebKit
import SnapKit

final class ItemDetailViewController: UIViewController {
    // MARK: - UI
    let webView = WKWebView()
    
    // MARK: - Properties
    
    var itemTitle : String?
    var itemLink : String?
    var itemId : String?
    var isLiked : Bool?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = itemTitle
        configureNavigationBackButtonItem()
        configureNavigationItem()
        
        configureBackgroundColor()
        configureSubView()
        configureLayout()
        loadWebView()
        
    }
    
    // MARK: - EventSelector
    @objc private func islikedButtonClicked() {
        toggleLike()
    }
    // MARK: - SetupUI
    
    private func configureNavigationItem() {
        guard let isLiked else {return}
        let likedImage = AssetImage.likeSelected?.withRenderingMode(.alwaysTemplate)
        let unlikedImage = AssetImage.likeSelected?.withRenderingMode(.alwaysTemplate)
        
        let islikedButton = UIBarButtonItem(image: isLiked ? likedImage : unlikedImage, style: .plain, target: self, action: #selector(islikedButtonClicked))
        islikedButton.tintColor = isLiked ? Color.black : Color.gray3

        navigationItem.rightBarButtonItems = [islikedButton]
    }
    
    private func configureSubView(){
        view.addSubview(webView)
    }
    private func configureLayout() {
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func loadWebView() {
        guard let itemLink else {return }
        let request = URLRequest(url: URL(string: itemLink)!)
        webView.load(request)
    }
    
    // MARK: - Method
    private func toggleLike() {
        //상태값 토글
        isLiked?.toggle()
        //UserDefaults에 id값 관리
        manageLikeItemIdListData()
        //네비게이션 아이템의 컬러 다시 세팅
        configureNavigationItem()
    }
    
    private func manageLikeItemIdListData() {
        var likeItemIdList = UserDefaults.standard.getLikeItemIdList() ?? []
        
        guard let isLiked, let itemId else {return }
        if isLiked {
            //append
            likeItemIdList.append(itemId)
            UserDefaults.standard.saveLikeItemIdList(likeItemIdList)
        }else {
            //remove
            let index = likeItemIdList.firstIndex{
                $0 == itemId
            }
            guard let index else {return }
            likeItemIdList.remove(at: index)
            UserDefaults.standard.saveLikeItemIdList(likeItemIdList)
        }
    }

}
