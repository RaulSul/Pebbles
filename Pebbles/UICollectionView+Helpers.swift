//
//  UICollectionView + Helpers.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 17.04.21.
//

import Foundation
import UIKit
import IGListKit

extension UICollectionView {
    static func sectionControllerForObject(
        modelObject: Any,
        workingRangeDelegate: ListWorkingRangeDelegate? = nil
    ) -> ListSectionController {
        if modelObject is SpacerSectionControllerModel {
            return SpacerSectionController()
        } else if modelObject is ConnectingLineControllerModel {
            return ConnectingLineController()
        }
        fatalError("can't find a matching section controller for the provided model")
    }
}
