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
    
    var profileImage : UIImage?
    
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
    }
    

    // MARK: - SetupDelegate
    // MARK: - AddTarget
    private func setupAddTarget() {
    }
    // MARK: - EventSelector
    // MARK: - SetupUI
    // MARK: - APIFetch
    // MARK: - PageTransition
    
    // MARK: - Method
    private func configureProfileImage() {
        viewManager.profileCircleView.imageView.image = profileImage
    }

}
