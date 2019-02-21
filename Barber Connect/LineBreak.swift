//
//  LineBreak.swift
//  Barber Connect
//
//  Created by Jonathan on 2/20/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class LineBreak: UIView {
    
    private let line = UIView()
    
    convenience init(lineColor:UIColor?) {
        self.init(frame: .zero)
        if let color = lineColor {
            line.backgroundColor = color
        } else {
            line.backgroundColor = UIColor("BEBEBE")
        }
    }
    
    convenience init(title:String) {
        self.init(lineColor: nil)
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = title
        text.font = UIFont.customFont(fontName: "CircularStd-Book", size: 20)
        text.textAlignment = .center
        text.backgroundColor = .white
        text.textColor = UIColor("9DA7B0")
        self.addSubview(text)
        text.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        text.widthAnchor.constraint(equalToConstant: 52).isActive = true
        text.heightAnchor.constraint(equalTo: self.heightAnchor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(line)
        line.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        line.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
