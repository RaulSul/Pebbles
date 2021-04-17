//
//  SpacerSectionControllerModel.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import Foundation
import IGListKit

class ConnectingLineControllerModel: ListDiffable {
    let id: String

    init(
        id: String
    ) {
        self.id = id
    }

    func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ConnectingLineControllerModel else { fatalError() }
        return self.id == object.id
    }
}
