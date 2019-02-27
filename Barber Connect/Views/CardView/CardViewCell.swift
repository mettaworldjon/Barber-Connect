//
//  CardViewCell.swift
//  Barber Connect
//
//  Created by Jonathan on 2/26/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    private let image:UIImageView = {
        let img = UIImageView(image: UIImage(named: "barber-2"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        img.clipsToBounds = true
        return img
    }()
    
    private let title:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.customFont(fontName: "CircularStd-Bold", size: 15)
        title.textColor = UIColor.mainTextColor()
        title.text = "Vinny's Barber"
        return title
    }()
    
    private let shopAddress:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.customFont(fontName: "CircularStd-Book", size: 12)
        title.textColor = UIColor.secondaryTextColor()
        title.text = "852 N Virgil Ave, Beverly Hills"
        return title
    }()
    
    private let starRating:CosmosView = {
        let rating = CosmosView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.starMargin = 1
        rating.settings.filledColor = UIColor("#FFC57C")
        rating.settings.filledBorderColor = UIColor("#FFC57C")
        rating.settings.emptyBorderColor = UIColor("#FFC57C")
        rating.settings.starSize = 12
        rating.settings.updateOnTouch = false
        rating.rating = 4
        rating.heightAnchor.constraint(equalToConstant: 10.99).isActive = true
        rating.widthAnchor.constraint(equalToConstant: 67.73).isActive = true
        return rating
    }()
    
    private let ratingCount:UILabel = {
        let count = UILabel()
        count.translatesAutoresizingMaskIntoConstraints = false
        count.font = UIFont.customFont(fontName: "CircularStd-Book", size: 12)
        count.textColor = UIColor.fadeGray()
        count.text = "(13 ratings)"
        return count
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 5
        self.shawdow()
        
        self.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.widthAnchor.constraint(equalTo: self.widthAnchor),
            image.heightAnchor.constraint(equalToConstant: (195/2) + 5)
            ])
        
        self.addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19),
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 11)
            ])
        
        self.addSubview(shopAddress)
        NSLayoutConstraint.activate([
            shopAddress.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            shopAddress.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            shopAddress.trailingAnchor.constraint(equalTo: title.trailingAnchor)
            ])
        
        self.addSubview(starRating)
        NSLayoutConstraint.activate([
            starRating.leadingAnchor.constraint(equalTo: shopAddress.leadingAnchor, constant: -2),
            starRating.topAnchor.constraint(equalTo: shopAddress.bottomAnchor, constant: 16)
            ])
        
        self.addSubview(ratingCount)
        NSLayoutConstraint.activate([
            ratingCount.leadingAnchor.constraint(equalTo: starRating.trailingAnchor, constant: 6.1),
            ratingCount.centerYAnchor.constraint(equalTo: starRating.centerYAnchor, constant: 0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
