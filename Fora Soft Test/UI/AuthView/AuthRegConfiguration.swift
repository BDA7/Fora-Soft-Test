//
//  AuthRegConfiguration.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 12.09.2023.
//

import Foundation

final class AuthRegConfiguration {
    static func buildAuth(_ coordinator: Coordinator?) -> AuthViewController {
        let view = AuthViewController()
        view.coordinator = coordinator
        view.bindUI(titleButton: "Войти", titleText: "Вход", titleNavButton: "Регистрация")
        return view
    }
    
    static func buildRegister(_ coordinator: Coordinator?) -> AuthViewController {
        let view = AuthViewController()
        view.coordinator = coordinator
        view.typeView = .reg
        view.bindUI(titleButton: "Зарегестрироваться", titleText: "Регистрация", titleNavButton: "Войти")
        return view
    }
}
