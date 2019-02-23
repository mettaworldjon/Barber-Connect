//
//  LoginController.swift
//  Barber Connect
//
//  Created by Jonathan on 2/20/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class LoginController: FormModal {
    
    // Email TextField
    private let emailTextField = CustomTextField(placeholder: "Email", title: "Email")
    
    // Password TextField
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
    
    // Facebook Login
    private let facebook = SocialButton(SocialButton.SocialType.facebook)
    
    // Google Login
    private let google = SocialButton(SocialButton.SocialType.google)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Log in your Account")
        setFields(fields: [emailTextField,passwordTextField])
        setFooterBtnTitle(title: "New user? Signup", attributedString: nil)
    }
    
    // Overriding Configuration of UI
    override func configureUI() {
        super.configureUI()
        
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
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginBtn.heightAnchor.constraint(equalToConstant: 62),
            loginBtn.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor, constant: 44)
            ])
        
        let breakLine = LineBreak(title: "Or")
        view.addSubview(breakLine)
        NSLayoutConstraint.activate([
            breakLine.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 26),
            breakLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26.5),
            breakLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26.5),
            breakLine.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        let stackView2 = UIStackView(arrangedSubviews: [facebook,google])
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .vertical
        stackView2.spacing = 21
        view.addSubview(stackView2)
        NSLayoutConstraint.activate([
            stackView2.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor),
            stackView2.trailingAnchor.constraint(equalTo: loginBtn.trailingAnchor),
            stackView2.topAnchor.constraint(equalTo: breakLine.bottomAnchor, constant: 18),
            ])
        
    }
    
    // Overriden Assign Handlers
    override func assignHandlers() {
        super.assignHandlers()
        // Email & Password
        emailTextField.addTarget(self, action: #selector(didbeginEditing), for: .editingDidBegin)
        emailTextField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        passwordTextField.addTarget(self, action: #selector(didbeginEditing), for: .editingDidBegin)
        passwordTextField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        
        // Facbook & Google
        facebook.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(facebookBtnHandler)))
        google.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(googleBtnHandler)))
        
        // Sign Up Launcher
        setFooterTarget(selector: #selector(launchSignUpVC))
        
    }
    
    override func pushUp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.loginBtn.transform = CGAffineTransform(translationX: 0, y: -25)
        }, completion: nil)
    }
    
    override func pushDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.loginBtn.transform = .identity
        }, completion: nil)
    }
    
}

// Button Hanlders
extension LoginController {
    
    // Facebook Handler
    @objc private func facebookBtnHandler() {
        
    }
    
    // Google Handler
    @objc private func googleBtnHandler() {
        
    }
    
    // Launch SignUp Controller
    @objc private func launchSignUpVC() {
        let registerVC = RegisterController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
}


