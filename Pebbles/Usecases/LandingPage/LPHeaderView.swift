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
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor(red: 0.93, green: 0.78, blue: 0.26, alpha: 1.00).cgColor
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var profileBackgroundConnectorDot: UIView = {
        let connectingDot: UIView = UIView()
        connectingDot.backgroundColor = .white
        
        return connectingDot
    }()
    
    lazy var lblName: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.text = "Hey, I'm " + "Raul" + "! 👋"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .black
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    lazy var lblStory: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.text = "... and this is my story so far:"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = .black
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        
        self.addSubview(self.profileBackground)
        self.insertSubview(self.profilePicture, aboveSubview: self.profileBackground)
        self.insertSubview(self.profileBackgroundConnectorDot, aboveSubview: self.profileBackground)
        
        self.addSubview(self.lblName)
        self.addSubview(self.lblStory)
        
        //MARK: - Layout
        
        self.profileBackground.snp.remakeConstraints { make in
//            make.centerX.equalTo(self.snp.centerX)
            make.height.width.equalTo(140)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        
        self.profileBackgroundConnectorDot.snp.remakeConstraints { make in
            make.bottom.equalTo(self.profileBackground.snp.bottom)
            make.centerX.equalTo(self.profileBackground.snp.centerX)
            make.height.equalTo(5)
            make.width.equalTo(5)
        }
        
        self.profilePicture.snp.remakeConstraints { make in
            make.center.equalTo(self.profileBackground.snp.center)
            make.height.width.equalTo(120)
        }
        
        self.lblName.snp.remakeConstraints { make in
            make.top.equalTo(self.profilePicture.snp.top).offset(10)
            make.leading.equalTo(self.profileBackground.snp.trailing).offset(20)
            make.height.equalTo(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        self.lblStory.snp.remakeConstraints { make in
            make.top.equalTo(self.lblName.snp.bottom).offset(10)
            make.height.equalTo(self.lblName.snp.height)
            make.leading.equalTo(self.lblName.snp.leading)
            make.trailing.equalTo(self.lblName.snp.trailing)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
