//
//  FirstViewController.swift
//  TestStevia
//
//  Created by Robert Seitsinger on 4/19/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit
import Stevia

class FirstViewController: UIViewController {

    let topMargin: CGFloat = 40
    let bottomMargin: CGFloat = 20
    let sideMargin: CGFloat = 15
    
    let firstView = FirstView()
    let secondView = SecondView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        firstView.delegate = self
        
        // Add the Stevia based views to the view hierarchy.
        // 'sv' just calls the addSubview method for each view in the list.
        self.view.sv(
            firstView,
            secondView
        )
        
        // Identify where in the containing view the Stevia based views will go.
        self.view.layout(
            topMargin, // fixed distance
            |-sideMargin-firstView-sideMargin-| ~ 200,
            "", // variable height
            |-sideMargin-secondView-sideMargin-| ~ 300,
            bottomMargin // fixed distance
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension FirstViewController: FirstViewProtocol {
    func updateInfo(first: String?, last: String?) {
        secondView.updateLabels(first: first, last: last)        
    }
}






