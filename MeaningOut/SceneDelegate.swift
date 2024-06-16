//
//  SceneDelegate.swift
//  MeaningOut
//
//  Created by 하연주 on 6/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        print("🎀nickname -> ", UserDefaults.standard.profileImageName)
        print("🎀nickname -> ", UserDefaults.standard.nickname)
        
        if UserDefaults.standard.nickname == nil {
            let rootVC = OnboardingViewController()
            let nav = UINavigationController(rootViewController: rootVC)
            window?.rootViewController = nav
        } else {
            changeRootViewControllerToSearchHome()
        }
        
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    // MARK: - Change Root View
    
    /// SearchHomeViewController로 루트뷰를 변경합니다.
    func changeRootViewControllerToSearchHome() {
        guard let window = self.window else { return }
        
        //네비게이션 컨트롤러 생성
        let searchHomeVC = UINavigationController(rootViewController: SearchHomeViewController())
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())

        //탭바 컨트롤러 생성
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = Color.mainOrange
        tabBarVC.tabBar.unselectedItemTintColor = Color.gray3
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([searchHomeVC, settingsVC], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        // 탭바 이름/이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        
        //SearchHomeViewController
        items[0].title = "검색"
        items[0].image = IconImage.search
        
        //SettingsViewController
        items[1].title = "설정"
        items[1].image = IconImage.person
        
        
        window.rootViewController = tabBarVC
        
    }

}

