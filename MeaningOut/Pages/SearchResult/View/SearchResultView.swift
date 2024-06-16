//
//  SearchResultView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import SnapKit

struct SortState {
    let sortName : String
    let isSelected : Bool
}

final class SearchResultView: UIView {
    let sortList = Sort.allCases
    
    // MARK: - UI
    private let totalLabel : UILabel = {
        let label = UILabel()
        label.text = "-- 개의 검색 결과"
        label.font = Font.bold13
        label.textColor = Color.mainOrange
        return label
    }()
    
    private lazy var simSortButton : OutlineBorderButton = {
        let button = OutlineBorderButton(title: sortList[0].sortText, isSelected: true)
        return button
    }()
    
    private lazy var dateSortButton : OutlineBorderButton = {
        let button = OutlineBorderButton(title: sortList[1].sortText, isSelected: false)
        return button
    }()
    
    private lazy var ascSortButton : OutlineBorderButton = {
        let button = OutlineBorderButton(title: sortList[2].sortText, isSelected: false)
        return button
    }()
    
    private lazy var dscSortButton : OutlineBorderButton = {
        let button = OutlineBorderButton(title: sortList[3].sortText, isSelected: false)
        return button
    }()
    
    lazy var sortBUttonStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [simSortButton, dateSortButton, ascSortButton, dscSortButton])
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.distribution = .fill
        return sv
    }()
    
    lazy var searchResultCollectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionVewLayout(numberofItemInrow: 2,sectionSpacing: 20 ,height: 350))
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
        [totalLabel, sortBUttonStackView, searchResultCollectionView]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).offset(10)
        }
        
        [simSortButton, dateSortButton, ascSortButton, dscSortButton]
            .forEach{
                $0.snp.makeConstraints { make in
                    make.height.equalTo(25)
                }
            }
        
        sortBUttonStackView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
        }
        
        searchResultCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sortBUttonStackView.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }


}
