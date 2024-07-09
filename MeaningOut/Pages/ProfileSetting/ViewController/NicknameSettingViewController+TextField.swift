//
//  NicknameSettingViewController+TextField.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit

extension NicknameSettingViewController : UITextFieldDelegate{
    //입력할때마다
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        vm.inputNicknameWillReplaced.value = string
        return vm.outputChatacterValidation.value
    }
}

