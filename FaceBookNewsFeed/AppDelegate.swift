//
//  AppDelegate.swift
//  FaceBookNewsFeed
//
//  Created by Hoang Tung Lam on 10/19/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        window?.rootViewController = navigationController
        
        navigationController.navigationBar.barTintColor = UIColor(red: 51.0/255.0, green: 90.0/255.0, blue: 149.0/255.0, alpha: 1)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        application.statusBarStyle = .lightContent
        return true
    }
}

