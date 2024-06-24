//
//  ViewController++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit

extension UIViewController {
    func configureBackgroundColor() {
        view.backgroundColor = Color.white
    }
    
    // MARK: - ConfigureNavigation
    func configureNavigationBackButtonItem() {
        let backButton = UIBarButtonItem(image: IconImage.chevronLeft, style: .plain, target: self, action: #selector(popToPrevPage))
        backButton.tintColor = Color.gray1
        navigationItem.leftBarButtonItems = [backButton]
    }
    
    // MARK: - PageTransition
    @objc private func popToPrevPage() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - HideKeyboard

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - AlertController
    func showAlert(title : String, message : String?, style :  UIAlertController.Style, confirmTitle : String = "확인", confirmHandler : @escaping ()->Void) {
        //1. 얼럿 컨트롤러
        let altert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        //2. 버튼
        let confirm = UIAlertAction(title: confirmTitle, style: .default){ _ in
            confirmHandler()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //3. 액션 버튼 붙이기
        altert.addAction(confirm)
        altert.addAction(cancel)
        
        //4. 얼럿 띄워주기
        present(altert, animated: true)
    }
    
    

}
