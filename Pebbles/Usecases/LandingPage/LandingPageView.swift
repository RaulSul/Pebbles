//
//  LandingPageView.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 16.04.21.
//

import UIKit
import SnapKit

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
        
        self.profilePicture.snp.remakeConstraints { make in
            make.top.equalTo(self.snp.top).offset(60)
            make.centerX.equalTo(self.snp.centerX)
            make.height.width.equalTo(120)
        }
        
        self.collectionView.snp.remakeConstraints { make in
            make.top.equalTo(self.profilePicture.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
