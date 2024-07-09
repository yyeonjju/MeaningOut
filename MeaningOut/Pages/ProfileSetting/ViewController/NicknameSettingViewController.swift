//
//  NicknameSettingViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit
import Toast

class NicknameSettingViewController: UIViewController {
    
    // MARK: - UI
    let viewManager = NicknameSettingView()
    
    // MARK: - Properties
    var pageMode : PageMode = .onboarding
    let vm = NicknameSettingViewModel()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = PageTitle.nicknameSetting
        
        configureBackgroundColor()
        configureNavigationBackButtonItem()
        setupDelegate()
        setupAddTarget()
        setupGestureEvent()
        if pageMode == .onboarding {
            vm.inputViewDidLoadTrigger.value = ()
        }
        
        bindData()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureProfileImage()
    }
    
    // MARK: - BindData
    func bindData() {
        vm.outputValidationNoticeText.bind { [weak self] value in
            guard let self else {return }
            self.changeWarningLabel(value)
        }
        
        vm.outputCountResettingNicknameText.bind { [weak self] value in
            guard let self else {return }
            viewManager.nicknameTextFieldView.textField.text = value
        }
        
        if pageMode == .onboarding{
            vm.outputRamdomProfileImageName.bind { [weak self] value in
                guard let self else {return }
                UserDefaults.standard.saveProfileImageName(value)
                configureProfileImage()
            }
        }

    }
    
    // MARK: - SetupDelegate
    private func setupDelegate() {
        viewManager.nicknameTextFieldView.textField.delegate = self
    }

    // MARK: - AddTarget
    private func setupAddTarget() {
        viewManager.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        viewManager.nicknameTextFieldView.textField.addTarget(self, action: #selector(nicknameTextFieldDidChange), for: .editingChanged)
    }
    
    private func setupGestureEvent() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        viewManager.profileCircleView.addGestureRecognizer(imageTapGesture)
    }
    
    // MARK: - EventSelector
    @objc func completeButtonTapped() {
        guard let textCount = viewManager.nicknameTextFieldView.textField.text?.count else {return }

        if textCount >= NicknameValidation.textMinCount && textCount <= NicknameValidation.textMaxCount{
            showAlert(title: "프로필 세팅을 완료하시겠습니까?", message: nil, style: .alert){
                
                if self.pageMode == .onboarding {
                    ///루트뷰 변경
                    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                    sceneDelegate?.changeRootViewControllerToSearchHome(isFirstRendered: true)
                }else {
                    ///pop 뷰컨트롤러
                    self.navigationController?.popViewController(animated: true)
                }
                
                ///UserDefaults에 닉네임 저장
                UserDefaults.standard.saveNickname(self.viewManager.nicknameTextFieldView.textField.text)
                
                if self.pageMode == .onboarding{
                    ///UserDefaults에 날짜 저장
                    UserDefaults.standard.saveSignupDate(Date())
                }
            }
        }else {
            self.view.makeToast(ToastMessage.checkNickname, duration: 2.0, position: .top)
        }

    }
    
    @objc func nicknameTextFieldDidChange() {
        vm.inputNicknameText.value = viewManager.nicknameTextFieldView.textField.text

    }
    
    @objc func profileImageTapped() {
        pushToNextPage()
    }
    
    // MARK: - PageTransition
    private func pushToNextPage() {
        let nextVC = ProfileImageSettingViewController()
        nextVC.pageMode = self.pageMode
        let savedImageName = UserDefaults.standard.getProfileImageName()
        
        nextVC.profileImageName = savedImageName
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - Method
    
    func changeWarningLabel(_ noticeText : String = "") {
        
        let targetLabel = viewManager.nicknameTextFieldView.warningLabel
        if noticeText.isEmpty {
            targetLabel.text = NicknameValidationNoticeText.validNickname
            targetLabel.textColor = Color.gray2
            targetLabel.alpha = 1
        }else {
            targetLabel.text = noticeText
            targetLabel.textColor = Color.mainOrange
            targetLabel.alpha = 1
        }

    }
    
    private func configureProfileImage() {
        let savedImageName =  UserDefaults.standard.getProfileImageName()
        if let savedImageName {
            viewManager.profileCircleView.imageView.image = UIImage(named: savedImageName)
        }
    }
    
    
}
