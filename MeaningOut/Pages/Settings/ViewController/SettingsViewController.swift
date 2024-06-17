//
//  SettingsViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    // MARK: - UI
    let viewManager = SettingsView()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = PageTitle.Settings
        configureBackgroundColor()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUIData()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.settingsTableView.dataSource = self
        viewManager.settingsTableView.delegate = self
        viewManager.settingsTableView.register(CustomTrailingLabelTableViewCell.self, forCellReuseIdentifier: CustomTrailingLabelTableViewCell.identifier)
    }
    
    // MARK: - SetupUI
    private func setupUIData() {
        viewManager.settingsTableView.reloadData()
        
        let profileImageName = UserDefaults.standard.profileImageName ?? ""
        let nickname = UserDefaults.standard.nickname
        viewManager.profileCircleView.imageView.image = UIImage(named: profileImageName)
        viewManager.nicknameLabel.text = nickname
    }
    
    // MARK: - PageTransition
    private func changeRootView() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.changeRootViewControllerToOnboarding()
    }

    // MARK: - Method
    func userWithdrawalCellTapped() {
        showWithdrawalConformAlert()
    }
    
    private func showWithdrawalConformAlert() {
        //얼럿 컨트롤러
        let altert = UIAlertController(title: "탈퇴하기", message: "탈퇴를하면 데이터가 모두 초기화됩니다. 탈퇴하시겠습니까?", preferredStyle: .alert)
        //버튼
        let confirm = UIAlertAction(title: "확인", style: .default){[weak self] _ in
            guard let self = self else { return }
            
            self.deleteAllUserData() //저장해놓은 데이터 모두 삭제
            self.changeRootView() ///루트뷰 변경
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        //액션 버튼 붙이기
        altert.addAction(confirm)
        altert.addAction(cancel)
        //얼럿 띄워주기
        present(altert, animated: true)
        
        
    }
    
    private func deleteAllUserData() {
        UserDefaults.standard.profileImageName = nil
        UserDefaults.standard.nickname = nil
        UserDefaults.standard.searchList = nil
        UserDefaults.standard.likeItemIdList = nil
    }

}

