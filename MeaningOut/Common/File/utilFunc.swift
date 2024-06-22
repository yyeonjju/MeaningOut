//
//  utilFunc.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit


internal func configureCollectionVewLayout (numberofItemInrow : Int, cellIneterSpacing : CGFloat = 10, sectionSpacing :  CGFloat = 30, height: CGFloat? = nil) -> UICollectionViewLayout{
    let layout = UICollectionViewFlowLayout()
    let numberofItemInrow : CGFloat = CGFloat(numberofItemInrow)
    
    let cellIneterSpacing : CGFloat = cellIneterSpacing
    let sectionSpacing : CGFloat = sectionSpacing
    let inset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
    let availableWidth = UIScreen.main.bounds.width - (cellIneterSpacing*numberofItemInrow) - inset.left - inset.right
    
    
    layout.itemSize = CGSize(width: availableWidth/numberofItemInrow, height: height ?? availableWidth/numberofItemInrow)
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = cellIneterSpacing
    layout.sectionInset = inset
    
    return layout
}


internal func isOnlyWhitespace(_ text: String) -> Bool {
    return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
}


///닉네임 유효성 검증 - 1)  곧 입력될 문자 판벌 (shouldChangeCharactersIn 시점)
internal func validateNicknameInputCharacter(willBeReplaced : String) throws -> Bool {
    let invalidSpecialCharaters = NicknameValidation.invalidSpecialCharaters

    if let index = invalidSpecialCharaters.firstIndex(of: willBeReplaced) {
        throw NicknameInputError.specialCharacterInput(character: invalidSpecialCharaters[index])
    }
    
    if let _ = Int(willBeReplaced) {
        throw NicknameInputError.numberInput
    }
    
    return true
}

///닉네임 유효성 검증 - 2)  입력된 후 count 판별 (.editingChanged 시점)
internal func validateNicknameInputCount(textField : UITextField) throws {
    let textMinCount = NicknameValidation.textMinCount
    let textMaxCount = NicknameValidation.textMaxCount
    
    guard let text = textField.text else {return }
    
    if (text.count) < textMinCount {
        throw NicknameInputError.lessThanMinAmount
    }

    if (text.count) > textMaxCount {
        textField.text = String(text.dropLast())
        throw NicknameInputError.moreThanMaxAmount
    }
}
