//
//  RecentSearchTableViewCell.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit
import SnapKit

class RecentSearchTableViewCell: UITableViewCell {
    // MARK: - Properties
    var removeCell : ((RecentSearchTableViewCell) -> Void)?


    // MARK: - UI
    private let clockImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = IconImage.clock
        iv.tintColor = Color.gray1
        return iv
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "----"
        label.font = Font.regular14
        return label
    }()
    
    private let xMarkImageView : UIButton = {
        let button = UIButton()
        button.setImage(IconImage.xmark, for: .normal)
        button.tintColor = Color.gray1
        return button
    }()
    
    
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubView()
        configureLayout()
        setupAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    private func configureSubView() {
        [clockImageView, label, xMarkImageView]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    private func configureLayout() {
        clockImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.centerY.leading.equalTo(contentView)

        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(clockImageView.snp.trailing).offset(20)
        }
        
        xMarkImageView.snp.makeConstraints { make in
            make.size.equalTo(15)
            make.centerY.trailing.equalTo(contentView)
        }
    }

    // MARK: - ConfigureData
    func configureData(text: String ){
        label.text = text
    }
    
    // MARK: - setupAddTarget
    private func setupAddTarget() {
        xMarkImageView.addTarget(self, action: #selector(xMarkClicked), for: .touchUpInside)
    }

    @objc func xMarkClicked() {
        removeCell?(self)
    }
    

}
