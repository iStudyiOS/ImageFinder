//
//  TabBarViewController.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/17.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
        createNavController(for: FeedViewController(), title: NSLocalizedString("Feed", comment: ""), image: UIImage(systemName: "house")!),
        createNavController(for: LikedViewController(), title: NSLocalizedString("Liked", comment: ""), image: UIImage(systemName: "heart")!)
        ]
    }
}
