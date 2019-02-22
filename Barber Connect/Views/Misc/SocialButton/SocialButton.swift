//
//  SocialButton.swift
//  Barber Connect
//
//  Created by Jonathan on 2/20/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SocialButton: UIButton {
    
    private let title:UILabel = UILabel()
    private let image:UIImageView = UIImageView()
    
    enum SocialType {
        case facebook
        case google
    }
    
    convenience init(_ type:SocialType) {
        self.init(type: .system)
        if type == SocialType.facebook {
            self.title.text = "Log in with Facebook"
            image.image = UIImage(named: "facebook")
            image.heightAnchor.constraint(equalToConstant: 20).isActive = true
            image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        } else {
            self.title.text = "Log in with Facebook"
            image.image = UIImage(named: "google")
            image.heightAnchor.constraint(equalToConstant: 20).isActive = true
            image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor("81A5FB").cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 62).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        title.font = UIFont.customFont(fontName: "CircularStd-Book", size: 16)
        title.textColor = UIColor("44596D")
        
        let stackView = UIStackView(arrangedSubviews: [image,title])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    @objc func handleSelect() {
        print("Helloooo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.title.alpha = 0.5
            self.image.alpha = 0.5
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.title.alpha = 1
            self.image.alpha = 1
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.title.alpha = 1
            self.image.alpha = 1
        }
    }
    
    
}
