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
    let section_1ID = "section-1ID"
    
    
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
        collectionView.register(SectionOneContainer.self, forCellWithReuseIdentifier: section_1ID)
    }
    
    // Navbar Configuration
    private func configureNav() {
        let menu = UIBarButtonItem(image: UIImage(named: "menu-button"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItems = [menu]
    }
    
    // Number of Sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // Number of Cells per Section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    // Header Height (Spacing Optionally)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 16)
    }
    
    // Cell Sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.frame.width, height: 139)
        case 1:
            return CGSize(width: view.frame.width, height: 261)
        default:
            return CGSize.zero
        }
    }
    
    // Cell Rendering
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let searchView = collectionView.dequeueReusableCell(withReuseIdentifier: searchID, for: indexPath) as! SearchHomeView
            return searchView
        case 1:
            let section_1_Container = collectionView.dequeueReusableCell(withReuseIdentifier: section_1ID, for: indexPath)
            return section_1_Container
        default:
            return UICollectionViewCell()
        }
    }
    
}
