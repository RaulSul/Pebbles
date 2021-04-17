//
//  SpacerSectionControllerModel.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import Foundation
import IGListKit

class AddEventControllerModel: ListDiffable {
    let id: String
    var onAddEvent: (() -> Void)?

    init(
        id: String,
        onAddEvent: (() -> Void)?
    ) {
        self.id = id
        self.onAddEvent = onAddEvent
    }

    func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? AddEventControllerModel else { fatalError() }
        return self.id == object.id
    }
}
