//
//  utilFunc.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

internal func changeRootView(rootVC : UIViewController) {
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let sceneDelegate = windowScene?.delegate as? SceneDelegate

    let rootVC = UINavigationController(rootViewController: rootVC)
    
    sceneDelegate?.window?.rootViewController = rootVC
    sceneDelegate?.window?.makeKeyAndVisible()
}


internal func configureCollectionVewLayout (numberofItemInrow : Int, cellIneterSpacing : CGFloat = 10, sectionSpacing :  CGFloat = 30, height: CGFloat? = nil) -> UICollectionViewLayout{
    let layout = UICollectionViewFlowLayout()
    let numberofItemInrow : CGFloat = CGFloat(numberofItemInrow)
    
    let cellIneterSpacing : CGFloat = cellIneterSpacing
    let sectionSpacing : CGFloat = sectionSpacing
    let inset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
    let availableWidth = UIScreen.main.bounds.width - (cellIneterSpacing*numberofItemInrow) - inset.left - inset.right
    
    
    layout.itemSize = CGSize(width: availableWidth/numberofItemInrow, height: height ?? availableWidth/numberofItemInrow)
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = cellIneterSpacing
    layout.sectionInset = inset
    
    return layout
}
