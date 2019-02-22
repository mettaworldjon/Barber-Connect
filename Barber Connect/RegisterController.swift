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
    
    private let nameField = CustomTextField(placeholder: "Name", title: "Name")
    private let emailField = CustomTextField(placeholder: "Email", title: "Email")
    private let phoneField = CustomTextField(placeholder: "Phone no.", title: "Phone no.")
    private let passwordField = CustomTextField(placeholder: "Password", title: "Password", password: true)
    private let comfirmPassword = CustomTextField(placeholder: "Comfirm Password", title: "Comfirm Password", password: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Sign Up")
        setFields(fields: [nameField,emailField,phoneField,passwordField,comfirmPassword])
        setNavbar()
        
    }
    
    private func setNavbar() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 20
        let image = UIImageView(image: UIImage(named: "left-arrow")?.withRenderingMode(.alwaysOriginal))
        image.frame = CGRect(x: 0, y: 0, width: 18, height: 12)
        image.contentMode = .scaleAspectFit
        self.navigationItem.leftBarButtonItems = [spacer, UIBarButtonItem(customView: image)]
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
}
