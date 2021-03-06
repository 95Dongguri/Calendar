//
//  SceneDelegate.swift
//  Calendar
//
//  Created by κΉλν on 2022/06/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemGray
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
    }
}
