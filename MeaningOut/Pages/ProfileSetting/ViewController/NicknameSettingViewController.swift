//
//  NicknameSettingViewController.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit

class NicknameSettingViewController: UIViewController {
    
    // MARK: - UI
    let viewManager = NicknameSettingView()
    
    // MARK: - Properties
    let textFieldMinCount = 2
    let textFieldMaxCount = 9
    var pageMode : PageMode = .onboarding
    
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
            setupRandomProfileImageName()
        }

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureProfileImage()
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

        if textCount >= textFieldMinCount && textCount <= textFieldMaxCount{
            showConfirmAlert(){
                
                if self.pageMode == .onboarding {
                    ///루트뷰 변경
                    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                    sceneDelegate?.changeRootViewControllerToSearchHome()
                }else {
                    ///pop 뷰컨트롤러
                    self.navigationController?.popViewController(animated: true)
                }
                
                ///UserDefaults에 닉네임 저장
                UserDefaults.standard.nickname = self.viewManager.nicknameTextFieldView.textField.text
                
                if self.pageMode == .onboarding{
                    ///UserDefaults에 날짜 저장
                    UserDefaults.standard.signupDate = Date()
                }
            }
        }

    }
    
    @objc func nicknameTextFieldDidChange() {
        validateNicknameCount()
    }
    
    @objc func profileImageTapped() {
        pushToNextPage()
    }
    
    // MARK: - PageTransition
    private func pushToNextPage() {
        let nextVC = ProfileImageSettingViewController()
        nextVC.pageMode = self.pageMode
        let savedImageName = UserDefaults.standard.profileImageName
        
        nextVC.profileImageName = savedImageName
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - Method
    private func validateNicknameCount() {
        var noticeText = ""
        guard let text = viewManager.nicknameTextFieldView.textField.text else {return }
        
        if (text.count) < textFieldMinCount {
            noticeText = TextFieldValidationText.invalidCount
        }
        
        if (text.count) > textFieldMaxCount {
            noticeText = TextFieldValidationText.invalidCount
            viewManager.nicknameTextFieldView.textField.text = String(text.dropLast())
        }
        
        changeWarningLabel(noticeText)

    }
    
    func changeWarningLabel(_ noticeText : String) {
        let targetLabel = viewManager.nicknameTextFieldView.warningLabel
        if noticeText.isEmpty {
            targetLabel.text = TextFieldValidationText.validNickname
            targetLabel.textColor = Color.gray2
            targetLabel.alpha = 1
        }else {
            targetLabel.text = noticeText
            targetLabel.textColor = Color.mainOrange
            targetLabel.alpha = 1
        }

    }
    
    func showConfirmAlert(confirmHandler : @escaping ()->Void){
        //1. 얼럿 컨트롤러
        let altert = UIAlertController(title: "프로필 세팅을 완료하시겠습니까?", message: nil, preferredStyle: .alert)
        
        //2. 버튼
        let confirm = UIAlertAction(title: "확인", style: .default){ _ in
            confirmHandler()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //3. 액션 버튼 붙이기
        altert.addAction(confirm)
        altert.addAction(cancel)
        
        //4. 얼럿 띄워주기
        present(altert, animated: true)
    }
    
    private func setupRandomProfileImageName() {
        let profileImageName = ProfileImageName.returnRandomProfileImageName()
        UserDefaults.standard.profileImageName = profileImageName
        
        configureProfileImage()
    }
    
    private func configureProfileImage() {
        let savedImageName =  UserDefaults.standard.profileImageName
        if let savedImageName {
            viewManager.profileCircleView.imageView.image = UIImage(named: savedImageName)
        }
    }
    
    
}
