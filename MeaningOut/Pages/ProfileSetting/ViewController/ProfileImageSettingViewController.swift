//
//  ProfileImageSettingViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit

class ProfileImageSettingViewController: UIViewController {
    // MARK: - UI
    let viewManager = ProfileImageSettingView()
    var profileImageName : String?
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = PageTitle.profileImageSetting
        configureBackgroundColor()
        configureProfileImage()
        setupDelegate()
    }
    

    // MARK: - SetupDelegate
    private func setupDelegate(){
        viewManager.profileImageCollectionView.dataSource = self
        viewManager.profileImageCollectionView.delegate = self
        viewManager.profileImageCollectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: ProfileImageCollectionViewCell.identifier)
    }
    
    
    // MARK: - AddTarget
    private func setupAddTarget() {
    }
    // MARK: - EventSelector
    // MARK: - SetupUI
    // MARK: - APIFetch
    // MARK: - PageTransition
    
    // MARK: - Method
    private func configureProfileImage() {
        guard let profileImageName else {return }
        viewManager.profileCircleView.imageView.image = UIImage(named: profileImageName)
    }

}
