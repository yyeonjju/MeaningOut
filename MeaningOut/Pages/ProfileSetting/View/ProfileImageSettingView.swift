//
//  ProfileImageSettingView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit
import SnapKit

class ProfileImageSettingView: UIView {

    // MARK: - UI
    let profileCircleView : ProfileCircleView = {
        let view = ProfileCircleView(width: Size.bigProfileImageWidth)
        
        return view
    }()
    
    lazy var profileImageCollectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionVewLayout())
        return cv
    }()
    
    
    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [profileCircleView, profileImageCollectionView]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        profileCircleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
        }
        
        profileImageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(profileCircleView.snp.bottom).offset(30)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    

    
    private func configureCollectionVewLayout () -> UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        let numberofItemInrow : CGFloat = 4
        
        let cellIneterSpacing : CGFloat = 10
        let sectionSpacing : CGFloat = 30
        let inset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        let availableWidth = UIScreen.main.bounds.width - (cellIneterSpacing*numberofItemInrow) - inset.left - inset.right
        
        
        layout.itemSize = CGSize(width: availableWidth/numberofItemInrow, height: availableWidth/numberofItemInrow)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = cellIneterSpacing
        layout.sectionInset = inset
        
        return layout
    }


}
