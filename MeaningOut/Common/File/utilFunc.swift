//
//  utilFunc.swift
//  MeaningOut
//
//  Created by 하연주 on 6/15/24.
//

import UIKit

internal func changeRootView(rootVC : UIViewController) {
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let sceneDelegate = windowScene?.delegate as? SceneDelegate

    let rootVC = UINavigationController(rootViewController: rootVC)
    
    sceneDelegate?.window?.rootViewController = rootVC
    sceneDelegate?.window?.makeKeyAndVisible()
}
