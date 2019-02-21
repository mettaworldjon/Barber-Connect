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
            controllerHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 63)
            ])
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: controllerHeader.bottomAnchor, constant: 25)
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
    
    @objc private func stopEditing() {
        view.endEditing(true)
    }
    
}
