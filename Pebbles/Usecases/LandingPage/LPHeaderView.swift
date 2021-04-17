//
//  LPHeaderView.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import UIKit



class LPHeaderView: UIView {
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
    
    lazy var profileBackground: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 140))
        view.layer.cornerRadius = view.frame.width / 2
        view.backgroundColor = .white
        
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        
        self.addSubview(self.profileBackground)
        self.insertSubview(self.profilePicture, aboveSubview: self.profileBackground)
        
        //MARK: - Layout
        
        self.profileBackground.snp.remakeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.height.width.equalTo(140)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.profilePicture.snp.remakeConstraints { make in
            make.center.equalTo(self.profileBackground.snp.center)
            make.height.width.equalTo(120)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
