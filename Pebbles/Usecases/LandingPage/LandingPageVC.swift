//
//  ViewController.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 16.04.21.
//

import UIKit
import IGListKit

class LandingPageVC: UIViewController {
    
    var TAG: String = "[LandingPageVC]"
    
    var listItems = [ListDiffable]()
    var adapter: ListAdapter?

    lazy var rootView: LandingPageView = {
        let view: LandingPageView = LandingPageView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.rootView)
        
        //MARK: IGListKitStuff
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self)
        adapter.collectionView = self.rootView.collectionView
        adapter.dataSource = self
        self.adapter = adapter
        
        
        self.invalidate()
        
        //MARK: - Layout
        self.rootView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.rootView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.rootView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.rootView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }


    func invalidate() {
        self.listItems = []
        
        self.listItems.append(
            SpacerSectionControllerModel(
                id: "top_spacer",
                backgroundColor: .cyan
            )
        )
        
        DispatchQueue.main.async {
            self.adapter?.performUpdates(animated: true, completion: nil)
            print(self.TAG + " >>> Invalidated")
        }
        
    }
    
    
}


extension LandingPageVC: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.listItems
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return UICollectionView.sectionControllerForObject(modelObject: object)
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}


extension UICollectionView {
    static func sectionControllerForObject(
        modelObject: Any,
        workingRangeDelegate: ListWorkingRangeDelegate? = nil
    ) -> ListSectionController {
        if modelObject is SpacerSectionControllerModel {
            return SpacerSectionController()
        }
        fatalError("can't find a matching section controller for the provided model")
    }
}

