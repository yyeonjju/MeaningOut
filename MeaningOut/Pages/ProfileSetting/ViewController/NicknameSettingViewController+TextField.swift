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
        var returnResult = false
        
        do{
            returnResult = try validateNicknameInputCharacter(willBeReplaced: string)
        } catch (let nicknammeError as NicknameInputError) {
            print("validateNicknameInputCharacter error", nicknammeError)
            DispatchQueue.main.async {
                self.changeWarningLabel(nicknammeError.validationNoticeText())
            }
        }catch {
            print(error)
        }
        
        return returnResult
    }
}

