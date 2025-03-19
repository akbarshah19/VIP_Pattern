//
//  SceneDelegate.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let homeVC = HomeViewController2()
        window.rootViewController = homeVC
        self.window = window
        window.makeKeyAndVisible()
    }
}

