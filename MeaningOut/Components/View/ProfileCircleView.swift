//
//  ProfileCircleView.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit
import SnapKit

final class ProfileCircleView : UIView {
    // MARK: - UI
    private let imageContentView : UIView = {
        let view = UIView()
        view.layer.borderColor = Color.mainOrange?.cgColor
        view.layer.borderWidth = 5
        view.clipsToBounds = true
        return view
    }()
    
    private let imageView : UIImageView = {
        let iv = UIImageView()
//        iv.image = AssetImage.profile0
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let cameraIconView : UIView = {
        let view = UIView()
        view.backgroundColor = Color.mainOrange
        view.layer.borderColor = .none
        return view
    }()
    
    private let cameraIconImage : UIImageView = {
        let iv = UIImageView()
        iv.image = IconImage.cameraFill
        iv.tintColor = Color.white
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageContentView.layer.cornerRadius = imageContentView.frame.width/2
        cameraIconView.layer.cornerRadius = cameraIconView.frame.width/2
    }
    
    // MARK: - Initializer
    
    init(width : CGFloat, image : UIImage) {
        super.init(frame: .zero)
        
        imageView.image = image
        
        configureSubView()
        configureLayout(width : width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [imageContentView, cameraIconView]
            .forEach{
                addSubview($0)
            }
        
        [imageView]
            .forEach{
                imageContentView.addSubview($0)
            }
        
        [cameraIconImage]
            .forEach {
                cameraIconView.addSubview($0)
            }
    }
    
    func configureLayout(width : CGFloat) {
        self.snp.makeConstraints { make in
            make.size.equalTo(width)
        }
        
        imageContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cameraIconView.snp.makeConstraints { make in
            make.size.equalTo(width/3.5)
            make.centerX.equalTo(imageView.snp.trailing).inset(width/6)
            make.centerY.equalTo(imageView.snp.bottom).inset(width/6)
        }
        
        cameraIconImage.snp.makeConstraints { make in
            make.size.equalTo(width/6)
            make.center.equalToSuperview()
        }
    }

}
