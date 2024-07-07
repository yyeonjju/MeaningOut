//
//  SearchResultViewController+CollectionView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit

extension SearchResultViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        guard let searchResult else {return cell}
        let itemData = searchResult.items[indexPath.row]
        let isLike = likeProductList.map{$0.productId}.contains(itemData.productId)
        
        
        cell.configureData(data: itemData, isLike: isLike, searchKeyword: navigationItem.title)
        cell.manageLikeItemIdList = {[weak self] _ in
            guard let self else { return }
            
            
            if let index = likeProductList.firstIndex(where: {$0.productId == itemData.productId}) {
                //장바구니 삭제
                let data = likeProductList[index]
                repository.removeItem(data)
            } else {
                //장바구니 추가
                let data = ProductTable(title: itemData.title, link: itemData.link, image: itemData.image, lprice: itemData.lprice, hprice: itemData.hprice, mallName: itemData.mallName, productId: itemData.productId, productType: itemData.productType, brand: itemData.brand, maker: itemData.maker)
                repository.createItem(data)
            }
            
            self.viewManager.searchResultCollectionView.reloadItems(at: [IndexPath(row: indexPath.row, section: indexPath.section)])

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let searchResult else {return }
        let itemData = searchResult.items[indexPath.row]
        let isLiked = likeProductList.map{$0.productId}.contains(itemData.productId)
        pushToItemDetailPage(isLiked : isLiked,product: itemData)
        
    }
}


extension SearchResultViewController : UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let searchResult else {return}
        
        for item in indexPaths {
            if searchResult.items.count - 2 == item.row && (page*searchResult.display) < searchResult.total{
                page += 1
                getSearchResult()
            }
        }
    }
}
