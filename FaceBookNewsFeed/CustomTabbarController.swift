//
//  CustomTabbarController.swift
//  FaceBookNewsFeed
//
//  Created by Hoang Tung Lam on 10/20/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import Foundation
import UIKit

class CustomTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "New Feed"
        navigationController.tabBarItem.image = UIImage(named: "user")
        
        let friendRequestController = UIViewController()
        let secondNavigationController = UINavigationController(rootViewController: friendRequestController)
        secondNavigationController.title = "Request"
        secondNavigationController.tabBarItem.image = #imageLiteral(resourceName: "globe")
        viewControllers = [navigationController,secondNavigationController]
    }
}
