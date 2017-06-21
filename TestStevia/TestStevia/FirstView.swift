//
//  FirstView.swift
//  TestStevia
//
//  Created by Robert Seitsinger on 4/19/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit
import Stevia

protocol FirstViewProtocol {
    func updateInfo(first: String?, last: String?)
}

class FirstView: UIView {

    var delegate: FirstViewProtocol?
    
    let labelTitle = UILabel()
    let labelFirstName = UILabel()
    let labelLastName = UILabel()
    let textFieldFirstName = UITextField()
    let textFieldLastName = UITextField()
    let buttonSave = UIButton()

    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    fileprivate func render() {
        backgroundColor = .cyan
        
        self.sv(
            labelTitle,
            labelFirstName,
            labelLastName,
            textFieldFirstName,
            textFieldLastName,
            buttonSave
        )
        
        self.layout(
            20,
            |-15-labelTitle-15-|,
            15,
            |-15-labelFirstName.width(90)-5-textFieldFirstName-15-|,
            15,
            |-15-labelLastName.width(90)-5-textFieldLastName-15-|,
            "",
            |-15-buttonSave-15-|,
            20
        )
        
        labelTitle.text = "First View"
        labelTitle.textAlignment = .center
        
        labelFirstName.text = "First Name:"
        labelFirstName.textAlignment = .right
        textFieldFirstName.backgroundColor = .white
        
        labelLastName.text = "Last Name:"
        labelLastName.textAlignment = .right
        textFieldLastName.backgroundColor = .white
        
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.setTitleColor(.black, for: .normal)
        buttonSave.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }

    func tapped() {
        delegate?.updateInfo(first: textFieldFirstName.text, last: textFieldLastName.text)
    }

}









