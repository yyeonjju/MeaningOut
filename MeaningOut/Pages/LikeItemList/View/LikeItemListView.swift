//
//  LikeItemListView.swift
//  MeaningOut
//
//  Created by 하연주 on 7/7/24.
//

import UIKit
import SnapKit


final class LikeItemListView : UIView {
    // MARK: - UI
    let searchBar = {
        let sb = UISearchBar()
        
        return sb
    }()
    
    let likeItemTableView = {
        let sb = UITableView()
        sb.rowHeight = 150
        return sb
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
    
    private func configureSubView() {
        [searchBar, likeItemTableView]
            .forEach{
                addSubview($0)
            }
    }
    
    private func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        likeItemTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
