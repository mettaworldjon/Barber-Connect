//
//  SearchBarView.swift
//  Barber Connect
//
//  Created by Jonathan on 2/22/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SearchBarView: UIView {
    
    private let searchIcon = UIImageView(image: UIImage(named: "search"))
    private let searchField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor("E5ECED").cgColor
        
        
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.contentMode = .scaleAspectFit
        self.addSubview(searchIcon)
        NSLayoutConstraint.activate([
            searchIcon.heightAnchor.constraint(equalToConstant: 13.76),
            searchIcon.widthAnchor.constraint(equalToConstant: 13.76),
            searchIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.1),
            searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.placeholder = "Type here...."
        self.addSubview(searchField)
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 9.1),
            searchField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.1),
            searchField.centerYAnchor.constraint(equalTo: searchIcon.centerYAnchor)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startEditing() {
        
    }
    
}
