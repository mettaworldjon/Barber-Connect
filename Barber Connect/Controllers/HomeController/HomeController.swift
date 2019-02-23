//
//  HomeController.swift
//  Barber Connect
//
//  Created by Jonathan on 2/22/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    // Cell ID's
    let searchID = "searchID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNav()
        cellRegistration()
    }
    
    
    // UI Configuration
    private func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.keyboardDismissMode = .interactive
    }
    
    // Collection Registration
    private func cellRegistration() {
        collectionView.register(SearchHomeView.self, forCellWithReuseIdentifier: searchID)
    }
    
    // Navbar Configuration
    private func configureNav() {
        let menu = UIBarButtonItem(image: UIImage(named: "menu-button"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItems = [menu]
    }
    
    // Number of Sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Number of Cells per Section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // Header Height (Spacing Optionally)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 16)
    }
    
    // Cell Sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 139)
    }
    
    // Cell Rendering
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let searchView = collectionView.dequeueReusableCell(withReuseIdentifier: searchID, for: indexPath) as! SearchHomeView
            return searchView
        default:
            return UICollectionViewCell()
        }
    }
    
}
