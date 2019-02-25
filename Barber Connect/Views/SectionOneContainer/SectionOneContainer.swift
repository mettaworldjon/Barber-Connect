//
//  SectionOneContainer.swift
//  Barber Connect
//
//  Created by Jonathan on 2/24/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SectionOneContainer: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    
    // Container Title
    private let title:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.customFont(fontName: "CircularStd-Bold", size: 17)
        label.textColor = UIColor.mainTextColor()
        label.text = "Near By Saloon"
        return label
    }()
    
    // See All Button
    private let seeAllBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sell All (8)", for: .normal)
        btn.setTitleColor(UIColor.secondaryTextColor(), for: .normal)
        btn.titleLabel?.font = UIFont.customFont(fontName: "CircularStd-Book", size: 12)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // UI Configuration
    private func configureUI() {
        self.addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: self.topAnchor)
            ])
        
        self.addSubview(seeAllBtn)
        NSLayoutConstraint.activate([
            seeAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            seeAllBtn.topAnchor.constraint(equalTo: self.topAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
