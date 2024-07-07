//
//  ItemDetailViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import WebKit
import SnapKit
import RealmSwift

final class ItemDetailViewController: UIViewController {
    // MARK: - UI
    let webView = WKWebView()
    
    // MARK: - Properties
    
    var isLiked : Bool?
    var product : SearchResultItem?
    let repository = RealmDBRepository()  //realm
    var likeProductList : Results<ProductTable>! //realm

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = product?.titleWithoutHtmlTag
        configureNavigationBackButtonItem()
        configureNavigationItem()
        
        configureBackgroundColor()
        configureSubView()
        configureLayout()
        loadWebView()
        
        let value = repository.getAllObjects(tableModel: ProductTable.self)
        likeProductList = value
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
        guard let itemLink = product?.link else {return }
        let request = URLRequest(url: URL(string: itemLink)!)
        webView.load(request)
    }
    
    // MARK: - Method
    private func toggleLike() {
        //상태값 토글
        isLiked?.toggle()
        manageLikeItemIdListData()
        //네비게이션 아이템의 컬러 다시 세팅
        configureNavigationItem()
    }
    
    private func manageLikeItemIdListData() {
        guard let isLiked, let product else {return }
        
        if isLiked {
            //장바구니 추가
            let data = ProductTable(title: product.title, link: product.link, image: product.image, lprice: product.lprice, hprice: product.hprice, mallName: product.mallName, productId: product.productId, productType: product.productType, brand: product.brand, maker: product.maker)
            repository.createItem(data)
            
        }else {
            
            guard let index = likeProductList.firstIndex(where: {$0.productId == product.productId}) else {return }
            //장바구니 삭제
            let data = likeProductList[index]
            repository.removeItem(data)
        }
    }

}
