//
//  RadioButton.swift
//  Barber Connect
//
//  Created by Jonathan on 2/19/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class CustomRadioButton: UIButton {
    
    private let circle:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor("B3BFD0").cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 6.925
        view.heightAnchor.constraint(equalToConstant: 13.85).isActive = true
        view.widthAnchor.constraint(equalToConstant: 13.85).isActive = true
        return view
    }()
    private var btnSelected = false
    
    convenience init(_ status:Bool) {
        self.init(type: .system)
        btnSelected = status
        if btnSelected {
            active()
        } else {
            deactive()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.customFont(fontName: "HelveticaNeue", size: 16)
        self.setTitleColor(UIColor("B6BBBF"), for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 19.95, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .leading
        self.addSubview(circle)
        NSLayoutConstraint.activate([
            circle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        print("Switching")
        if btnSelected {
            deactive()
        } else {
            active()
        }
    }
    
    func active() {
        circle.backgroundColor = UIColor("759BFA")
        circle.layer.borderColor = UIColor("759BFA").cgColor
        btnSelected = true
    }
    
    func deactive() {
        circle.backgroundColor = .white
        circle.layer.borderColor = UIColor("B3BFD0").cgColor
        btnSelected = false
    }
    
    func status() -> Bool {
        return btnSelected
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
