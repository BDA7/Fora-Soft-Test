//
//  ViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit

class RootViewController: UITabBarController {
    let searchView = SearchModule.build()
    let historyView = HistoryModule.build()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        
        setupViews()
    }

    func setupViews() {
        viewControllers = [createNavControllers(for: searchView, title: "Search", image: UIImage(systemName: "magnifyingglass")!, selectImage: UIImage(systemName: "magnifyingglass")!),
                           createNavControllers(for: historyView, title: "History", image: UIImage(systemName: "star")!, selectImage: UIImage(systemName: "star")!) ]
    }


    fileprivate func createNavControllers(for rootViewController: UIViewController, title: String, image: UIImage, selectImage: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectImage

        return navController
    }
}

