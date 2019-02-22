//
//  TextField+Theme.swift
//  Barber Connect
//
//  Created by Jonathan on 2/19/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CustomTextField: SkyFloatingLabelTextField {
    
    convenience init(placeholder:String, title:String, password:Bool = false) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        self.title = title
        self.isSecureTextEntry = password
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor("828B95")
        self.tintColor = UIColor("828B95")
        self.titleColor = UIColor("828B95")
        self.selectedTitleColor = UIColor("828B95")
        self.placeholderColor = UIColor("828B95")
        self.lineColor = UIColor("CED6E2")
        self.selectedLineColor = UIColor("CED6E2")
        self.font = UIFont.customFont(fontName: "CircularStd-Book", size: 15)
        self.titleFont = UIFont.customFont(fontName: "CircularStd-Book", size: 15)
        self.heightAnchor.constraint(equalToConstant: 63).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
