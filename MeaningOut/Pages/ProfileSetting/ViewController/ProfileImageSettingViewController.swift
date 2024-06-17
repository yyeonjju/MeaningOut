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
    var profileImageName : String? {
        didSet{
            configureProfileImage()
            viewManager.profileImageCollectionView.reloadData()
        }
    }
    
    // MARK: - Properties
    var pageMode : PageMode = .onboarding
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = PageTitle.profileImageSetting
        configureNavigationBackButtonItem()
        
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
    
    // MARK: - Method
    private func configureProfileImage() {
        guard let profileImageName else {return }
        viewManager.profileCircleView.imageView.image = UIImage(named: profileImageName)
    }

}
