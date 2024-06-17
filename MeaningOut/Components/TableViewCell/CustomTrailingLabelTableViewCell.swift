//
//  CustomTrailingLabelTableViewCell.swift
//  MeaningOut
//
//  Created by 하연주 on 6/17/24.
//

import UIKit

class CustomTrailingLabelTableViewCell : UITableViewCell{
    
    var trailingView : UIView = {
        let view = UIView()
        
        return view
    }()
    
    let trailingLabel : UILabel = {
        let label = UILabel()
        label.font = Font.regular13
        return label
    }()

    let trailingImageView : UIImageView = {
        let iv = UIImageView()
        iv.tintColor = Color.black
        return iv
    }()

    
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
        guard let textLabel else {return }
        //superView에 있는 textLabel도 leading에 딱 맞춰주기
        textLabel.snp.makeConstraints { make in
            make.centerY.leading.equalTo(contentView)
        }
        
        contentView.addSubview(trailingView)
        [trailingImageView, trailingLabel]
            .forEach{
                trailingView.addSubview($0)
            }
        

        trailingView.snp.makeConstraints { make in
            make.leading.equalTo(textLabel.snp.trailing)
            make.trailing.verticalEdges.equalTo(contentView)
        }
        
        trailingImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.trailing.equalTo(trailingLabel.snp.leading).offset(-4)
            make.centerY.equalToSuperview()
        }
        trailingLabel.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
        }
    }
    
    func configureTrailingView(option : SettingOptions) {
        
        let likeAmount = UserDefaults.standard.likeItemIdList?.count ?? 0
        
        trailingImageView.image = option.trailingImage?.withRenderingMode(.alwaysTemplate)
        trailingLabel.text = option.trailingLabelText(likeAmount: likeAmount)
        if option == .likeList {
            trailingLabel.boldSpecificText(searchText: "\(likeAmount)개", font: Font.bold15)
        }

    }
}
