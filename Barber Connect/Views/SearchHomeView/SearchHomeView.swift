//
//  SearchView.swift
//  Barber Connect
//
//  Created by Jonathan on 2/22/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit


class SearchHomeView: UICollectionViewCell {
    
    // Welcome Header
    private let welcomeHeader:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.font = UIFont.customFont(fontName: "CircularStd-Bold", size: 23)
        label.textColor = UIColor.mainTextColor()
        return label
    }()
    
    // Sub Header
    private let subHeader:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seach a fresh one"
        label.textColor = UIColor.fadeGray()
        return label
    }()
    
    // Change Location Button
    private let changeLocationBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Change", for: .normal)
        btn.titleLabel?.font = UIFont.customFont(fontName: "CircularStd-Book", size: 12)
        btn.setTitleColor(UIColor.mainBlue(), for: .normal)
        return btn
    }()
    
    // Ping Location Button
    private let pingLocationBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "nav-icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // Search Bar
    private let searchBar:SearchBarView = {
        let sb = SearchBarView()
        return sb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func configureUI() {
        self.backgroundColor = .white
        
        self.addSubview(welcomeHeader)
        NSLayoutConstraint.activate([
            welcomeHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            welcomeHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
            ])
        
        self.addSubview(subHeader)
        NSLayoutConstraint.activate([
            subHeader.leadingAnchor.constraint(equalTo: welcomeHeader.leadingAnchor),
            subHeader.topAnchor.constraint(equalTo: welcomeHeader.bottomAnchor, constant: 7)
            ])
        
        self.addSubview(changeLocationBtn)
        NSLayoutConstraint.activate([
            changeLocationBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            changeLocationBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 1)
            ])
        
        self.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: welcomeHeader.bottomAnchor, constant: 40),
            searchBar.leadingAnchor.constraint(equalTo: welcomeHeader.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: changeLocationBtn.trailingAnchor)
            ])
        
        self.addSubview(pingLocationBtn)
        NSLayoutConstraint.activate([
            pingLocationBtn.trailingAnchor.constraint(equalTo: changeLocationBtn.trailingAnchor),
            pingLocationBtn.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -11)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
