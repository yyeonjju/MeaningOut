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
        let invalidCharaters = ["@", "#", "$", "%"]
        
        /// Backspace 감지 - 이거 하지 않으면 textField .editingChanged 실행되지 않는다
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {return true}
        }
        
        var noticeText = ""
        
        ///불가능한 특수문자 검사
        if let index = invalidCharaters.firstIndex(of: string){
            noticeText = TextFieldValidationText.invalidCharacter(invalid: invalidCharaters[index])
            changeWarningLabel(noticeText)
            return false
            
        }
        
        ///숫자입력 못하도록
        if let _ = Int(string) {
            noticeText = TextFieldValidationText.invalidNumber
            changeWarningLabel(noticeText)
            return false
        }
        
        changeWarningLabel(noticeText)
        return true
    }


}
