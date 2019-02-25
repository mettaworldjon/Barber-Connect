//
//  UIView+Shadow.swift
//  Barber Connect
//
//  Created by Jonathan on 2/24/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIView {
    func shawdow() {
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor("E5ECED").cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 5
    }
}
