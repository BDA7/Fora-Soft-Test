//
//  QueryRouter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit


protocol QueryRouterProtocol {
    var transitionHandler: UIViewController? { get set }
}

final class QueryRouter: QueryRouterProtocol {
    var transitionHandler: UIViewController?
}
