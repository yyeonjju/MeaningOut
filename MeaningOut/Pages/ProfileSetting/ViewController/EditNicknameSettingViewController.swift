//
//  EditNicknameSettingViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/17/24.
//

import UIKit

final class EditNicknameSettingViewController : NicknameSettingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewManager.completeButton.isHidden = true
        
        configureNavigationBarButtonItem()
        setupSavedData()
    }
    
    
    private func configureNavigationBarButtonItem() {
        let save = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        save.tintColor = Color.black
        navigationItem.title = "캘린더"
        navigationItem.rightBarButtonItems = [save]
    }
    
    @objc private func saveButtonTapped() {
        completeButtonTapped()
    }
    
    private func setupSavedData() {
        viewManager.nicknameTextFieldView.textField.text = UserDefaults.standard.getNickname()
    }

}
