//
//  SpacerSectionController.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import Foundation
import IGListKit

class AddEventController: ListSectionController {
    var item: AddEventControllerModel?

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: AddEventCell.self, for: self, at: index) as? AddEventCell else { fatalError() }
        cell.bindViewModel(self.item!)
        return cell
    }

    override func sizeForItem(at _: Int) -> CGSize {
        return CGSize(
            width: self.collectionContext!.containerSize.width,
            height: 55
        )
    }

    override func didUpdate(to object: Any) {
        guard let updatedModelObject = object as? AddEventControllerModel else { fatalError() }
        self.item = updatedModelObject
    }
}
