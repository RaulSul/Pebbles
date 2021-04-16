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
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = AppDelegate.shared.window!.bounds
//        gradient.colors = [
//            UIColor(red: 0.85, green: 0.93, blue: 0.57, alpha: 1.00).cgColor,
//            UIColor(red: 0.71, green: 0.89, blue: 0.55, alpha: 1.00).cgColor,
//            UIColor(red: 0.60, green: 0.85, blue: 0.55, alpha: 1.00).cgColor,
//            UIColor(red: 0.46, green: 0.78, blue: 0.58, alpha: 1.00).cgColor,
//            UIColor(red: 0.32, green: 0.71, blue: 0.60, alpha: 1.00).cgColor,
//            UIColor(red: 0.20, green: 0.63, blue: 0.64, alpha: 1.00).cgColor,
//            UIColor(red: 0.09, green: 0.54, blue: 0.68, alpha: 1.00).cgColor,
//            UIColor(red: 0.10, green: 0.46, blue: 0.62, alpha: 1.00).cgColor,
//            UIColor(red: 0.12, green: 0.38, blue: 0.57, alpha: 1.00).cgColor,
//            UIColor(red: 0.09, green: 0.31, blue: 0.47, alpha: 1.00).cgColor
//        ]
        gradient.colors = [
            UIColor(red: 0.85, green: 0.93, blue: 0.57, alpha: 1.00).cgColor,
            UIColor(red: 0.60, green: 0.85, blue: 0.55, alpha: 1.00).cgColor,
            UIColor(red: 0.32, green: 0.71, blue: 0.60, alpha: 1.00).cgColor,
            UIColor(red: 0.10, green: 0.46, blue: 0.62, alpha: 1.00).cgColor,
            UIColor(red: 0.09, green: 0.11, blue: 0.47, alpha: 1.00).cgColor
        ]
        
        return gradient
    }()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        self.addSubview(self.profilePicture)
        self.addSubview(self.collectionView)
        
        //MARK: - Layout
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
