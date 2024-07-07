//
//  LikeItemTableViewCell.swift
//  MeaningOut
//
//  Created by 하연주 on 7/7/24.
//

import UIKit
import SnapKit

final class LikeItemTableViewCell : UITableViewCell {
    // MARK: - UI
    let productImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        iv.clipsToBounds = true
        return iv
    }()
    
    let productNamelLabel = {
        let label = UILabel()
        label.font = Font.regular15
        label.textColor = Color.black
        label.numberOfLines = 2
        return label
    }()
    
    let mallNameLabel = {
        let label = UILabel()
        label.font = Font.regular13
        label.textColor = Color.gray3
        return label
    }()
    
    let priceLabel = {
        let label = UILabel()
        label.font = Font.bold16
        label.textColor = Color.black
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigureData
    func configureData(data : ProductTable) {
        productImageView.loadImage(urlString: data.image)
        productNamelLabel.text = data.title
        mallNameLabel.text = data.mallName
        priceLabel.text = "\(data.lprice) 원"
    }
    
    // MARK: - ConfigureUI
    
    private func configureSubView() {
        [productImageView, productNamelLabel,mallNameLabel,priceLabel ]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    private func configureLayout() {
        productImageView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalTo(contentView).inset(4)
            make.width.equalTo(100)
        }
        
        productNamelLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
            make.top.equalTo(contentView).offset(4)
//            make.height.equalTo(25)
        }
        
        mallNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
            make.top.equalTo(productNamelLabel.snp.bottom).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(mallNameLabel.snp.trailing).offset(10)
            make.top.equalTo(productNamelLabel.snp.bottom).offset(4)
        }
    }

}
