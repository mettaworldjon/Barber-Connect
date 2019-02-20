//
//  LoginController.swift
//  Barber Connect
//
//  Created by Jonathan on 2/19/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginController: UIViewController {
    
    // Controller Header
    private let controllerHeader:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log in your Account"
        label.font = UIFont.customFont(fontName: "CircularStd-Book", size: 30)
        return label
    }()
    
    // Email TextField
    private let emailTextField = CustomTextField(placeholder: "Email", title: "Email")
    
    // Email TextField
    private let passwordTextField = CustomTextField(placeholder: "Password", title: "Password", password: true)
    
    // Forgot Password Button
    private let forgotPasswordBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Forgot Password", for: .normal)
        btn.setTitleColor(UIColor("759BFA"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // Remember Me Button
    private let rememberBtn:CustomRadioButton = {
        let btn = CustomRadioButton(type: .system)
        btn.setTitle("Remember me", for: .normal)
        btn.titleLabel?.font = UIFont.customFont(fontName: "HelveticaNeue", size: 16)
        return btn
    }()
    
    // Login Button
    private let loginBtn = CustomMainButton(title: "Log In", backgroundColor: UIColor("759BFA"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        handleDegates()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    private func handleDegates() {
        emailTextField.addTarget(self, action: #selector(didbeginEditing), for: .editingDidBegin)
        emailTextField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        passwordTextField.addTarget(self, action: #selector(didbeginEditing), for: .editingDidBegin)
        passwordTextField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stopEditing)))
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(controllerHeader)
        NSLayoutConstraint.activate([
            controllerHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            controllerHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 63)
            ])
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 17
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: controllerHeader.bottomAnchor, constant: 25)
            ])
        
        view.addSubview(forgotPasswordBtn)
        NSLayoutConstraint.activate([
            forgotPasswordBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            forgotPasswordBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 33)
            ])
        
        view.addSubview(rememberBtn)
        NSLayoutConstraint.activate([
            rememberBtn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            rememberBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 33),
            rememberBtn.trailingAnchor.constraint(equalTo: forgotPasswordBtn.leadingAnchor, constant: 0)
            ])
        
        view.addSubview(loginBtn)
        NSLayoutConstraint.activate([
            loginBtn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginBtn.heightAnchor.constraint(equalToConstant: 62),
            loginBtn.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor, constant: 44)
            ])
    }
    
}

// Animations

extension LoginController:UITextFieldDelegate {
    @objc func didbeginEditing() {
        pushUp()
    }
    
    @objc func didEndEditing() {
        pushDown()
    }
    
    @objc func stopEditing() {
        view.endEditing(true)
    }
    
    private func pushUp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.loginBtn.transform = CGAffineTransform(translationX: 0, y: -20)
        }, completion: nil)
    }
    
    private func pushDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.loginBtn.transform = .identity
        }, completion: nil)
    }
}
