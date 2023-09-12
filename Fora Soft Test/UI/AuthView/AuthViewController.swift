//
//  AuthViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 12.09.2023.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    enum TypeView {
        case auth
        case reg
    }
    
    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let emailLabel = UILabel()
    private let passwrodLabel = UILabel()
    private let passwordTextField = UITextField()
    
    public var coordinator: Coordinator!
    public var typeView: TypeView = .auth
    
    
    private let authButton = UIButton()
    private let navButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        createTitle()
        createTextFields()
        createButton()
        setupNavButton()
    }
    
    private func createTitle() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(128)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func createTextFields() {
        emailLabel.textColor = .white
        emailLabel.text = "email"
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(34)
            $0.centerY.equalTo(view.snp.centerY).offset(-64)
        }
        
        emailTextField.backgroundColor = .white
        emailTextField.textColor = .black
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.cornerRadius = 10
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
        
        passwrodLabel.textColor = .white
        passwrodLabel.text = "password"
        view.addSubview(passwrodLabel)
        passwrodLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(34)
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
        }
        
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 10
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.top.equalTo(passwrodLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
    
    private func createButton() {
        authButton.addTarget(self, action: #selector(auth), for: .touchUpInside)
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.cornerStyle = .medium
        authButton.configuration = config
        view.addSubview(authButton)
        authButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(64)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
    
    private func setupNavButton() {
        navButton.addTarget(self, action: #selector(navig), for: .touchUpInside)
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.cornerStyle = .medium
        navButton.configuration = config
        view.addSubview(navButton)
        navButton.snp.makeConstraints {
            $0.top.equalTo(authButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
    
    public func bindUI(titleButton: String, titleText: String, titleNavButton: String) {
        titleLabel.text = titleText
        authButton.setTitle(titleButton, for: .normal)
        navButton.setTitle(titleNavButton, for: .normal)
    }
    
    @objc
    private func auth(_ sender: UIButton) {
        switch typeView {
        case .auth:
            coordinator.goToRoot()
        case .reg:
            coordinator.pop()
        }
    }
    
    @objc
    private func navig(_ sender: UIButton) {
        switch typeView {
        case .auth:
            coordinator.goToRega()
        case .reg:
            coordinator.pop()
        }
    }

}
