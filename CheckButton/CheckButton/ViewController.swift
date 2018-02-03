//
//  ViewController.swift
//  CheckButton
//
//  Created by Sean Calkins on 2/1/18.
//  Copyright © 2018 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var checkButton: CheckButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set selected bool on view did load in order to draw the correct symbol
        checkButton.isSelected = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func checkButtonTapped(_ sender: CheckButton) {
        sender.isSelected = !sender.isSelected
    }
    
}

