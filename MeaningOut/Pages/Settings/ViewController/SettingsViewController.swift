//
//  SettingsViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/16/24.
//

import UIKit
import SnapKit
import RealmSwift

final class SettingsViewController: UIViewController {
    // MARK: - UI
    let viewManager = SettingsView()
    
    // MARK: - Properties
    let repository = RealmDBRepository()  //realm
    var likeProductList : Results<ProductTable>! //realm

    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = PageTitle.Settings
        configureBackgroundColor()
        setupDelegate()
        setupGesture()
        let value = repository.getAllObjects(tableModel: ProductTable.self)
        likeProductList = value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUIData()
    }
    
    // MARK: - SetupGesture
    private func setupGesture(){
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(profileViewTapped))
        tapGesture.minimumPressDuration = 0
        viewManager.profileContentsView.addGestureRecognizer(tapGesture)
    }

    
    // MARK: - EventSelector
    
    //뷰를 탭하는 제스쳐에 따라 배경 색 다르게 주기위해 UILongPressGestureRecognizer.state으로 상태 분기하는함수 생성
    @objc private func profileViewTapped(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            viewManager.profileContentsView.backgroundColor = Color.gray3?.withAlphaComponent(0.4)
        } else if gesture.state == .ended {
            viewManager.profileContentsView.backgroundColor = Color.white
            
            pushToProfileSettingPage()
        }
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
        
        let profileImageName = UserDefaults.standard.getProfileImageName() ?? ""
        let nickname = UserDefaults.standard.getNickname()
        let signupDate = UserDefaults.standard.getSignupDate()
        let signupDateString = DateFormatter.yearDotMonthDotDay.string(from: signupDate)
        
        viewManager.profileCircleView.imageView.image = UIImage(named: profileImageName)
        viewManager.nicknameLabel.text = nickname
        viewManager.dateLabel.text = "\(signupDateString) 가입"
    }
    
    // MARK: - PageTransition
    private func changeRootView() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.changeRootViewControllerToOnboarding()
    }
    
    private func pushToProfileSettingPage() {
        let vc = EditNicknameSettingViewController()
        vc.pageMode = .edit
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Method
    func userWithdrawalCellTapped() {
        showAlert(title: "탈퇴하기", message: "탈퇴를하면 데이터가 모두 초기화됩니다. 탈퇴하시겠습니까?", style: .alert){[weak self] in
            guard let self = self else { return }
            
            self.deleteAllUserData() //저장해놓은 데이터 모두 삭제
            self.changeRootView() ///루트뷰 변경
        }
    }
    
    private func deleteAllUserData() {
        UserDefaults.standard.removeAllUserData()
    }

}


