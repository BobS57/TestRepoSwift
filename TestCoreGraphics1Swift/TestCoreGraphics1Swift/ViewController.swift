//
//  ViewController.swift
//  TestCoreGraphics1Swift
//
//  Created by Robert Seitsinger on 10/19/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate enum SelectedColor {
        case black
        case blue
        case green
        case red
    }
    
    @IBOutlet weak var btnBlack: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnRed: UIButton!
    
    @IBOutlet weak var viewDraw1: ViewDraw!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Core Graphics Demo"
        
        setBorderWidth()
        setBorder(for: .black)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var shouldAutorotate : Bool {
        return true
    }

    // Lock the UI to portrait only
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.portrait]
    }
    
    @IBAction func btnRedAction(_ sender: AnyObject) {
        setBorder(for: .red)
    }

    @IBAction func btnGreenAction(_ sender: AnyObject) {
        setBorder(for: .green)
    }
    
    @IBAction func btnBlueAction(_ sender: AnyObject) {
        setBorder(for: .blue)
    }
    
    @IBAction func btnBlackAction(_ sender: AnyObject) {
        setBorder(for: .black)
    }
    
    @IBAction func btnResetAction(_ sender: AnyObject) {
        setBorder(for: .black)
        viewDraw1.reset()
    }

    fileprivate func setBorder(for color: SelectedColor) {
        resetBorderColors()
        switch color {
        case .black:
            btnBlack.layer.borderColor = UIColor.white.cgColor
            viewDraw1.setColor(color: .black)
        case .blue:
            btnBlue.layer.borderColor = UIColor.white.cgColor
            viewDraw1.setColor(color: .blue)
        case .green:
            btnGreen.layer.borderColor = UIColor.white.cgColor
            viewDraw1.setColor(color: .green)
        case .red:
            btnRed.layer.borderColor = UIColor.white.cgColor
            viewDraw1.setColor(color: .red)
        }
    }
    
    fileprivate func setBorderWidth(width: CGFloat = 2) {
        btnBlack.layer.borderWidth = width
        btnBlue.layer.borderWidth = width
        btnGreen.layer.borderWidth = width
        btnRed.layer.borderWidth = width
    }
    
    fileprivate func resetBorderColors() {
        btnBlack.layer.borderColor = UIColor.clear.cgColor
        btnBlue.layer.borderColor = UIColor.clear.cgColor
        btnGreen.layer.borderColor = UIColor.clear.cgColor
        btnRed.layer.borderColor = UIColor.clear.cgColor
    }
}
