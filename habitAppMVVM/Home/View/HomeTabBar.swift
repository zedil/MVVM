//
//  HomeTabBar.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 31.12.2022.
//

import UIKit

class HomeTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        setupTabBar()
    }
    
    fileprivate func createTabBar(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupTabBar() {
          viewControllers = [
              createTabBar(for: HomeViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
              createTabBar(for: SummaryViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
              createTabBar(for: SettingsViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!),
              createTabBar(for: AddHabitViewController(), title: NSLocalizedString("+", comment: ""), image: UIImage(systemName: "person")!)
          ]
      }
    
    func configureTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
}
