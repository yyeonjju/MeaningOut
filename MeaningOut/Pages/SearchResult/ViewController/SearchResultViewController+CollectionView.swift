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
        let isLike = likeItemIdList.contains(itemData.productId)
        
        cell.configureData(data: itemData, isLike: isLike)
        cell.manageLikeItemIdList = {[weak self] _ in
            guard let self else { return }
            if isLike { ///좋아요가 되어 있는 상태에서 한번 더 눌렀으면 좋아요 리스트에서 삭제
                let index = self.likeItemIdList.firstIndex{
                    $0 == itemData.productId
                }
                guard let index else {return }
                self.likeItemIdList.remove(at: index)
                UserDefaults.standard.likeItemIdList = self.likeItemIdList
            }else { ///좋아요가 안되어 있는 상태에서 눌렀으면 좋아요 리스트에서 삭제
                self.likeItemIdList.append(itemData.productId)
                UserDefaults.standard.likeItemIdList = self.likeItemIdList
            }
        }
        
        return cell
    }
}
