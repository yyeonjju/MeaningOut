//
//  Error.swift
//  MeaningOut
//
//  Created by 하연주 on 6/21/24.
//

import Foundation


enum NicknameInputError : Error {
    case specialCharacterInput(character : String)
    case numberInput
    case lessThanMinAmount
    case moreThanMaxAmount
    
    func validationNoticeText() -> String {
        switch self {
        case .specialCharacterInput(let invalidCharacter):
            return NicknameValidationNoticeText.invalidCharacter(invalid: invalidCharacter)
        case .numberInput:
            return NicknameValidationNoticeText.invalidNumber
        case .lessThanMinAmount, .moreThanMaxAmount:
            return NicknameValidationNoticeText.invalidCount
        }
    }
    
}


