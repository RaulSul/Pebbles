//
//  ViewController.swift
//  Pebbles
//
//  Created by Raul Sulaimanov on 16.04.21.
//

import UIKit
import IGListKit

class LandingPageVC: UIViewController {

    lazy var rootView: LandingPageView = {
        let view: LandingPageView = LandingPageView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.rootView)
        
        self.rootView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.rootView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.rootView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.rootView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }


}

