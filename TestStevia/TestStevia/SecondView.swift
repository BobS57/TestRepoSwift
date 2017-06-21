//
//  SecondView.swift
//  TestStevia
//
//  Created by Robert Seitsinger on 4/19/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit
import Stevia

class SecondView: UIView {

    let labelTitle = UILabel()
    let labelFirstName = UILabel()
    let labelLastName = UILabel()

    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    fileprivate func render() {
        backgroundColor = .magenta
        
        self.sv(
            labelTitle,
            labelFirstName,
            labelLastName
        )
        
        self.layout(
            15,
            |-15-labelTitle-15-|,
            50,
            |-15-labelFirstName.width(160)-(>=5)-labelLastName.width(160)-15-|
        )
        
        labelTitle.text = "Second View"
        labelTitle.textAlignment = .center
        
        labelFirstName.text = "<first name not set>"
        labelLastName.text = "<last name not set>"
        
        labelFirstName.backgroundColor = .lightGray
        labelLastName.backgroundColor = .lightGray
    }

    func updateLabels(first: String?, last: String?) {
        labelFirstName.text = first
        labelLastName.text = last
    }
}













