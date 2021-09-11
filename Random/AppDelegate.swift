//
//  AppDelegate.swift
//  Random
//
//  Created by Andrey Dorofeev on 26.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let coordinator = RandomRootCoordinator(window: window)
        
        print(Randomizer().randomRandom())
        let color = Randomizer().randomColor()
        color.cgColor.components?.forEach({ it in
            print(it * 255)
        })
        
        return true
    }
}

