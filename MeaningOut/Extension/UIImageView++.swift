//
//  UIImageView++.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit

extension UIImageView {
    func configureDefaultImageView() {
        self.backgroundColor = Color.gray2
        self.layer.cornerRadius = 10
        self.contentMode = .scaleAspectFill
    }
    
    func configureCircleImageView(color : UIColor? = Color.gray2) {
        self.backgroundColor = color
        self.layer.cornerRadius = self.frame.width/2
        self.contentMode = .scaleAspectFill
    }
    

}


extension UIImageView {
    func loadImage(urlString: String) {
        let cacheKey = NSString(string: urlString)
        // imageCache 1) 이미지를 네트워크에서 다운로드하기 전에 캐시된 이미지가 있는지 검색
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            // imageCache 2) 캐시된 이미지가 있다면 -> 캐시된 이미지를 가져와서 image에 적용
            self.image = cachedImage
            return
        }
        // imageCache 3) 캐시된 이미지가 없다면 -> 네트워크 통신을 하여 이미지를 다운로드
        self.setImageDataFromUrlString(urlString: urlString)
    }
    
    private func setImageDataFromUrlString(urlString: String) {
        ImageLoadManager.shared.downloadImage(urlString: urlString) { data in
            DispatchQueue.main.async() { [weak self] in
                guard let self, let image = UIImage(data: data) else {return}
                let cacheKey = NSString(string: urlString)
                //imageCache 4) 새롭게 다운로드된 이미지 캐싱
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                self.image = image
            }
        }
    }
}
