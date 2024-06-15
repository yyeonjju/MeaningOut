//
//  SearchHomeView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit
import SnapKit

final class SearchHomeView: UIView {

    // MARK: - UI
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "브랜드, 상품 등을 입력하세요"
        return sb
    }()
    
    private let separator = Separator()
    
    private let recentSearchLabel : UILabel = {
        let label = UILabel()
        label.text = "최근검색"
        label.textColor = Color.black
        label.font = Font.bold15
        return label
    }()
    
    let deleteAllButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("전체 삭제", for: .normal)
        btn.backgroundColor = .clear
        btn.setTitleColor(Color.mainOrange, for: .normal)
        btn.titleLabel?.font = Font.regular14
        return btn
    }()
    
    
    let recentSearchTableView : UITableView = {
        let tv = UITableView()
        tv.rowHeight = 40
        return tv
    }()
    
    lazy var emptyView : UIView = {
        let view = UIView()
        view.backgroundColor = Color.white
        let imageView = UIImageView(image: AssetImage.empty)
        imageView.contentMode = .scaleAspectFill
        let label = UILabel()
        label.text = "최근 검색어가 없어요"
        label.textColor = Color.black
        label.font = Font.bold16
        label.textAlignment = .center
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view).inset(70)
            make.height.equalTo(imageView.snp.width).multipliedBy(1)
            make.top.equalTo(view.snp.top).offset(50)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view)
        }

        return view
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
        [searchBar, separator, recentSearchLabel, deleteAllButton, recentSearchTableView, emptyView]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
        recentSearchLabel.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.height.equalTo(20)
        }
        
        deleteAllButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.centerY.equalTo(recentSearchLabel.snp.centerY)
        }
        
        recentSearchTableView.snp.makeConstraints { make in
            make.top.equalTo(recentSearchLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }



}
