//
//  CustomFonts.swift
//  Barber Connect
//
//  Created by Jonathan on 2/19/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIFont {
    static func customFont(fontName:String, size:CGFloat) -> UIFont {
        if let customFont = UIFont(name: fontName, size: size) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
