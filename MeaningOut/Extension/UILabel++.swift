//
//  UILabel++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/14/24.
//

import UIKit


extension UILabel {
    
    enum IconDirection {
        case leading
        case trailing
    }
    
    /*
    //UILabel에 아이콘 넣기
    func attachIcon(image : UIImage, direction:IconDirection, text : String, font: UIFont){
        //NSAttributedString 형태로 이미지 만들기
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        let attachmentStr = NSAttributedString(attachment: attachment)
        
        //NSMutableAttributedString 형태를 만들어 
        let mutableAttributedString = NSMutableAttributedString()
        
        if direction == .leading {
            //.leading이면 이미지 append 먼저
            mutableAttributedString.append(attachmentStr)
        }

        //텍스트 append
        let textString = NSAttributedString(string: text, attributes: [.font: font])
        mutableAttributedString.append(textString)
        
        if direction == .trailing {
            //.trailing이면 이미지 append 나중에
            mutableAttributedString.append(attachmentStr)
        }
        
        self.attributedText = mutableAttributedString
    }
    */
    
    func boldSpecificText (searchText : String?, font : UIFont) {
        guard let searchText else {return }
        
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            var searchRange = labelText.startIndex..<labelText.endIndex
            
            while let range = labelText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive, range: searchRange) {
                text.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(range, in: labelText))
                searchRange = range.upperBound..<searchRange.upperBound
            }
            
            self.attributedText = text
        }
        
    }
    
    func tintSpecificTextColor (searchText : String?) {
        guard let searchText else {return }
        
        if let labelText = self.text {
            let text = NSMutableAttributedString(string: labelText)
            var searchRange = labelText.startIndex..<labelText.endIndex
            while let range = labelText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive, range: searchRange) {
                text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(range, in: labelText))
                searchRange = range.upperBound..<searchRange.upperBound
            }
            
            self.attributedText = text
        }
        
    }
    
}
