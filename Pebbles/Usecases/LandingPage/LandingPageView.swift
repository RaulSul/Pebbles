//
//  LandingPageView.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 16.04.21.
//

import UIKit
import SnapKit

class LandingPageView: UIView {
    
    lazy var headerView: LPHeaderView = {
        return LPHeaderView()
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        
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
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        self.addSubview(self.headerView)
        self.addSubview(self.collectionView)
        
        //MARK: - Layout
        
        self.headerView.snp.remakeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(self.snp.width)
        }
        
        self.collectionView.snp.remakeConstraints { make in
            make.top.equalTo(self.headerView.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
