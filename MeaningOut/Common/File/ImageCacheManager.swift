//
//  ImageCacheManager.swift
//  MeaningOut
//
//  Created by 하연주 on 6/22/24.
//

import UIKit

final class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
