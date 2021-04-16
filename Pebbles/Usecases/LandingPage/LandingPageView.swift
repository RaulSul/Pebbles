//
//  LandingPageView.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 16.04.21.
//

import UIKit

class LandingPageView: UIView {
    
    lazy var profilePicture: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        if let image: UIImage = UIImage(named: "raul") {
            imageView.image = image
        }
        
        return imageView
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .blue
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        self.addSubview(self.profilePicture)
        self.addSubview(self.collectionView)
        
        
        self.profilePicture.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.profilePicture.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        self.profilePicture.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.profilePicture.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.collectionView.topAnchor.constraint(equalTo: self.profilePicture.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
