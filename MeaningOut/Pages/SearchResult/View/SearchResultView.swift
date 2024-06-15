//
//  SearchResultView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit

final class SearchResultView: UIView {
    // MARK: - UI
    let label : UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [label]
            .forEach{
                addSubview($0)
            }
    }
    
    func configureLayout() {
        
    }


}
