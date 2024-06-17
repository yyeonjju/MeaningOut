//
//  CustomTrailingLabelTableViewCell.swift
//  MeaningOut
//
//  Created by 하연주 on 6/17/24.
//

import UIKit

class CustomTrailingLabelTableViewCell : UITableViewCell{
    
    var trailingView : UIView?
    
    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayout()
    }

    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Method
    
    private func configureUI() {
        textLabel?.font = Font.regular14
    }
    private func configureLayout(){
        guard let trailingView, let textLabel else {return }
        
        contentView.addSubview(trailingView)
    
        //superView에 있는 textLabel도 leading에 딱 맞춰주기
        textLabel.snp.makeConstraints { make in
            make.centerY.leading.equalTo(contentView)
        }
        
        trailingView.snp.makeConstraints { make in
            make.leading.equalTo(textLabel.snp.trailing)
            make.trailing.verticalEdges.equalTo(contentView)
        }
    }
}
