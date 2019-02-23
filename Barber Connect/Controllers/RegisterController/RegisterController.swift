//
//  RegisterController.swift
//  Barber Connect
//
//  Created by Jonathan on 2/19/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RegisterController: FormModal {
    
    // Registration Fields
    let fieldArray:[CustomTextField] = [
        CustomTextField(placeholder: "Name", title: "Name"),
        CustomTextField(placeholder: "Email", title: "Email"),
        CustomTextField(placeholder: "Phone no.", title: "Phone no."),
        CustomTextField(placeholder: "Password", title: "Password", password: true),
        CustomTextField(placeholder: "Comfirm Password", title: "Comfirm Password", password: true)
    ]
    
    // Register Button
    private let registerBtn:CustomMainButton = {
        let btn = CustomMainButton(title: "Sign up", backgroundColor: UIColor("759BFA"))
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Sign Up")
        setFields(fields: fieldArray)
        let attti = NSMutableAttributedString(string: "Already a user? ", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor("273D52"),
            NSAttributedString.Key.font : UIFont.customFont(fontName: "HelveticaNeue", size: 16)])
        attti.append(NSAttributedString(string: "Login Now", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor("759BFA"),
            NSAttributedString.Key.font : UIFont.customFont(fontName: "HelveticaNeue", size: 16)]))
        setFooterBtnTitle(title: nil, attributedString: attti)
        setNavbar()
        
    }
    
    // Overridden UI Configuration
    override func configureUI() {
        super.configureUI()
        view.addSubview(registerBtn)
        NSLayoutConstraint.activate([
            registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 29),
            registerBtn.heightAnchor.constraint(equalToConstant: 62)
            ])
    }
    
    // Overridden Assignment Handlers
    override func assignHandlers() {
        super.assignHandlers()
        for item in fieldArray {
            item.addTarget(self, action: #selector(didbeginEditing), for: .editingDidBegin)
            item.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        }
    }
    
    
    // Nav Bar Setup
    private func setNavbar() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 20
        let image = UIImageView(image: UIImage(named: "left-arrow")?.withRenderingMode(.alwaysOriginal))
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBack)))
        image.frame = CGRect(x: 0, y: 0, width: 18, height: 12)
        image.contentMode = .scaleAspectFit
        self.navigationItem.leftBarButtonItems = [spacer, UIBarButtonItem(customView: image)]
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        let rightButton = UIBarButtonItem(title: "Log in", style: .plain, target: self, action: #selector(goBack))
        let spacer2 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer2.width = 20
        
        self.navigationItem.rightBarButtonItems = [spacer2, rightButton]
        self.navigationItem.rightBarButtonItems?[1].setTitleTextAttributes([NSAttributedString.Key.font:UIFont.customFont(fontName: "CircularStd-Medium", size: 14)], for: .normal)
    }
    
    // Return to Previous VC
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    // Animations
    override func pushUp() {
        if fieldArray[2].isFirstResponder || fieldArray[3].isFirstResponder || fieldArray[4].isFirstResponder {
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.stackView.removeArrangedSubview(self.fieldArray[0])
                self.stackView.transform = CGAffineTransform(translationX: 0, y: -23)
            }, completion: nil)
        }
    }
    
    override func pushDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.stackView.insertArrangedSubview(self.fieldArray[0], at: 0)
            self.stackView.transform = .identity
        }, completion: nil)
    }
}
