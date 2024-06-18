//
//  SearchResultCollectionViewCell.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import SnapKit
import Kingfisher

class SearchResultCollectionViewCell: UICollectionViewCell {
    var manageLikeItemIdList : ((SearchResultCollectionViewCell)-> Void) = {_ in }
    
    // MARK: - UI
    private let productImageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        iv.clipsToBounds = true
        return iv
    }()
    
    private let likeButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderColor = .none
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let mallNamelLabel : UILabel = {
        let label = UILabel()
        label.text = "네이버"
        label.font = Font.regular13
        label.textColor = Color.gray3
        return label
    }()
    
    private let productNamelLabel : UILabel = {
        let label = UILabel()
        label.text = "지클릭커 레트로 SPK 100 저소음 무선 블루투스 기계식 --"
        label.font = Font.regular15
        label.textColor = Color.black
        label.numberOfLines = 2
        return label
    }()
    
    private let pricelLabel : UILabel = {
        let label = UILabel()
        label.text = " - 원"
        label.font = Font.bold16
        label.textColor = Color.black
        return label
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
    // MARK: - Selector
    
    @objc func likeButtonTapped() {
        manageLikeItemIdList(self)
    }

    
    // MARK: - ConfigureData

    func configureData(data : SearchResultItem, isLike : Bool, searchKeyword : String?) {
        let url = URL(string: data.image)
        productImageView.kf.setImage(with: url)
        mallNamelLabel.text = data.mallName
        productNamelLabel.text = data.titleWithoutHtmlTag
        productNamelLabel.tintSpecificTextColor(searchText: searchKeyword)
        pricelLabel.text = data.priceText
        
        if isLike {
            likeButton.setImage(AssetImage.likeSelected, for: .normal)
            likeButton.backgroundColor = Color.white
            likeButton.alpha = 1
        }else {
            likeButton.setImage(AssetImage.likeUnselected, for: .normal)
            likeButton.backgroundColor = Color.gray3
            likeButton.alpha = 0.4
        }

    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [productImageView, likeButton, mallNamelLabel, productNamelLabel, pricelLabel]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    func configureLayout() {
        
        productImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView)
            make.height.equalTo(250)
        }
        
        
        likeButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(productImageView).inset(10)
            make.size.equalTo(30)
        }
        
        
        mallNamelLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(contentView)
        }
        
        productNamelLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNamelLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(contentView)
        }
        
        pricelLabel.snp.makeConstraints { make in
            make.top.equalTo(productNamelLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(contentView)
        }
    }

}
