//
//  AppCoordinator.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 12.09.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func goToRega()
    
    func pop()
    
    func goToRoot()
    
}

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        goToAuth()
    }
    
    func goToRega() {
        let regView = AuthRegConfiguration.buildRegister(self)
        navigationController.pushViewController(regView, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func goToRoot() {
        let root = RootViewController()
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(root, animated: true)
    }
    
    private func goToAuth() {
        let authView = AuthRegConfiguration.buildAuth(self)
        navigationController.pushViewController(authView, animated: true)
    }
    
}
