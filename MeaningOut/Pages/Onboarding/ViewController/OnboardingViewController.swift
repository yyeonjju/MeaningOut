//
//  OnboardingViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - UI
    let viewManager = OnboardingView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundColor()
        setupAddTarget()
    }
    
    // MARK: - AddTarget
    private func setupAddTarget() {
        viewManager.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    // MARK: - EventSelector
    @objc private func startButtonTapped() {
        pushToNextPage()
    }
    

    // MARK: - PageTransition
    private func pushToNextPage() {
        let nextVC = NicknameSettingViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}
