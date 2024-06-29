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


enum RequestError : Error {
    case url
    case urlRequestError
    
    case failedRequest
    case noData
    case invalidResponse
    case failResponse(code : Int, message : String)
    case invalidData
    
    
    var errorMessage : String{
        switch self {
        case .url:
            return "url에러입니다."
        case .urlRequestError:
            return "urlRequest 에러"
        case .failedRequest:
            return "요청에 실패했습니다."
        case .noData:
            return "데이터가 없습니다."
        case .invalidResponse:
            return "유효하지 않은 응답입니다."
        case .failResponse(let errorCode, let message):
            return "\(errorCode)error : \(message)"
        case .invalidData:
            return "데이터 파싱 에러"
        }
    }
    
    
}


