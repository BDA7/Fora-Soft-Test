//
//  ViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit

class RootViewController: UITabBarController {
//Create SearchView
    let searchView = SearchModule.build()
//Create HistoryView
    let historyView = HistoryModule.build()
    
    let specialView = SpecialModule.build()


    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        
        setupViews()
    }

//Wrapping in navigationController and add to tabBar
    func setupViews() {
        viewControllers = [
            createNavControllers(for: searchView, title: "Search", image: UIImage(systemName: "magnifyingglass")!, selectImage: UIImage(systemName: "magnifyingglass")!),
            createNavControllers(for: historyView, title: "History", image: UIImage(systemName: "book")!, selectImage: UIImage(systemName: "book.fill")!),
            createNavControllers(for: specialView, title: "Special", image: UIImage(systemName: "star")!, selectImage: UIImage(systemName: "star.fill")!)
        ]
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

