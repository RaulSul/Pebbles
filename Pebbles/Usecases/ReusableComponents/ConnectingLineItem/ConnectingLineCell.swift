//
//  SpacerSectionCell.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import Foundation
import IGListKit
import UIKit

class ConnectingLineCell: UICollectionViewCell {
    var modelObject: ConnectingLineControllerModel?
    
    lazy var lineView: UIView = {
        let line: UIView = UIView()
        line.backgroundColor = UIColor(red: 0.93, green: 0.78, blue: 0.26, alpha: 1.00)
        return line
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(self.lineView)
        
        self.lineView.snp.remakeConstraints { make in
            make.center.equalTo(self.contentView.snp.center)
            make.height.equalTo(self.contentView.snp.height)
            make.width.equalTo(20)
        }
    }

    required init?(coder _: NSCoder) { fatalError("init(coder:)") }

    override func prepareForReuse() {
        self.modelObject = nil
    }
}

extension ConnectingLineCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? ConnectingLineControllerModel else { fatalError() }
        self.modelObject = model
    }
}

//extension SpacerSectionCell: PPCollectionViewCell {
//    static func calcHeightFor(givenWidth _: Float, item: Any) -> Int {
//        guard let item = item as? SpacerSectionControllerModel else { fatalError() }
//        return item.height
//    }
//}
