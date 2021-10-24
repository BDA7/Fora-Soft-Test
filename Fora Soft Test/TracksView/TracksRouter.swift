//
//  TracksRouter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit

protocol TracksRouterProtocol {
    var transitionHandler: UIViewController? { get set }
}

class TracksRouter: TracksRouterProtocol {
    var transitionHandler: UIViewController?
}
