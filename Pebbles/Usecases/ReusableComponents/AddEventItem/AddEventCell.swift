//
//  SpacerSectionCell.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import Foundation
import IGListKit
import UIKit

class AddEventCell: UICollectionViewCell {
    var modelObject: AddEventControllerModel?
    
    lazy var outerLineView: UIView = {
        let line: UIView = UIView()
        line.backgroundColor = UIColor(red: 0.93, green: 0.78, blue: 0.26, alpha: 1.00)
        return line
    }()
    
    lazy var innerLineView: UIView = {
        let line: UIView = UIView()
        line.backgroundColor = .white
        return line
    }()
    
    lazy var bttAdd: UIButton = {
        let btt: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btt.translatesAutoresizingMaskIntoConstraints = false
        btt.clipsToBounds = true
        btt.layer.masksToBounds = true
        btt.layer.cornerRadius = btt.frame.width / 2
        
        if let image: UIImage = UIImage(named: "plus") {
            btt.setImage(image, for: .normal)
        }
        return btt
    }()
    
    lazy var backgroundForButton: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.borderWidth = 2.5
        view.layer.borderColor = UIColor(red: 0.93, green: 0.78, blue: 0.26, alpha: 1.00).cgColor
        view.backgroundColor = .white
        
        return view
    }()
    
    required init?(coder _: NSCoder) { fatalError("init(coder:)") }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(self.outerLineView)
        self.contentView.insertSubview(self.innerLineView, aboveSubview: self.outerLineView)
        
        self.contentView.insertSubview(self.backgroundForButton, aboveSubview: self.innerLineView)
        self.contentView.insertSubview(self.bttAdd, aboveSubview: self.backgroundForButton)
        
        self.outerLineView.snp.remakeConstraints { make in
            make.height.equalTo(self.contentView.snp.height)
            make.width.equalTo(20)
            make.leading.equalTo(self.contentView.snp.leading).offset(80)
        }
        
        self.innerLineView.snp.remakeConstraints { make in
            make.center.equalTo(self.outerLineView.snp.center)
            make.height.equalTo(self.outerLineView.snp.height)
            make.width.equalTo(5)
        }
        
        self.backgroundForButton.snp.remakeConstraints { make in
            make.center.equalTo(self.innerLineView.snp.center)
            make.height.width.equalTo(50)
        }
        
        self.bttAdd.snp.remakeConstraints { make in
            make.center.equalTo(self.backgroundForButton.snp.center)
            make.height.width.equalTo(40)
        }
        
        self.bttAdd.addTarget(self, action: #selector(self.bttClicked), for: .touchUpInside)
    }
    
    @objc func bttClicked() {
        self.modelObject?.onAddEvent?()
    }

    override func prepareForReuse() {
        self.modelObject = nil
    }
}

extension AddEventCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? AddEventControllerModel else { fatalError() }
        self.modelObject = model
    }
}
