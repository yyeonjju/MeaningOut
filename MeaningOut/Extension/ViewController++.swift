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
}
