//
//  FormModal.swift
//  Barber Connect
//
//  Created by Jonathan on 2/20/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class FormModal: UIViewController {
    
    // Controller Header
    private let controllerHeader:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log in your Account"
        label.font = UIFont.customFont(fontName: "CircularStd-Book", size: 30)
        label.textColor = UIColor("3E4A59")
        return label
    }()
    
    // Field Stack
    let stackView:UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 17
        return sv
    }()
    
    // Footer Button
    private let footerButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.customFont(fontName: "HelveticaNeue", size: 16)
        btn.setTitleColor(UIColor("273D52"), for: .normal)
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        assignHandlers()
    }
    
    // Methods //
    
    // Configure User Interface
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(controllerHeader)
        NSLayoutConstraint.activate([
            controllerHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            controllerHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33)
            ])
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: controllerHeader.bottomAnchor, constant: 25)
            ])
        
        view.addSubview(footerButton)
        NSLayoutConstraint.activate([
            footerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14)
            ])
    }
    
    // Assign Handlers
    func assignHandlers() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stopEditing)))
    }
    
    // Add Title
    func setTitle(title:String) {
        controllerHeader.text = title
    }
    
    // Add Fields
    func setFields(fields:[SkyFloatingLabelTextField]) {
        for item in fields {
            stackView.addArrangedSubview(item)
        }
    }
    
    // Set Footer Button
    func setFooterBtnTitle(title:String?, attributedString:NSAttributedString?) {
        if let atti = attributedString {
            footerButton.setAttributedTitle(atti, for: .normal)
        } else {
            footerButton.setTitle(title, for: .normal)
            
        }
    }
    
    // Set Footer Target
    func setFooterTarget(selector:Selector) {
        footerButton.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    @objc private func stopEditing() {
        view.endEditing(true)
    }
    
}
