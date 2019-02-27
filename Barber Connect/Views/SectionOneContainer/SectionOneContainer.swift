//
//  SectionOneContainer.swift
//  Barber Connect
//
//  Created by Jonathan on 2/24/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SectionOneContainer: SectionCell {
    
    // Card ID
    private let cardID = "cardID"
    
    // Collection
    private let collection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 18
        layout.minimumLineSpacing = 18
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionFigure()
    }
    
    override func configureUI() {
        super.configureUI()
        self.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 42),
            collection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// Collection View Configuration
extension SectionOneContainer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Configuration
    private func collectionFigure() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(CardViewCell.self, forCellWithReuseIdentifier: cardID)
        
    }
    
    // Cell Inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 0)
    }
    
    // Size for card
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 228, height: 195)
    }
    
    // Cell Number of Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // Cell Rendering
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardID, for: indexPath) as! CardViewCell
        return cell
    }
    
}
