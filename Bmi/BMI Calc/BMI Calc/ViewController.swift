//
//  ViewController.swift
//  BMI Calc
//
//  Created by Barry Hubler on 1/22/20.
//  Copyright © 2020 Barry Hubler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myFirstyLabel: UILabel!
    
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFirstyLabel.text = "H3ll0 W0rld!"
        
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        x += 1;
        let xtext = String(x)
        myFirstyLabel.text = ("Button tapped " + xtext + " times!!!")
    }
    
    @IBAction func reset(_ sender: Any) {
        x = 0;
        
        myFirstyLabel.text = ("Button tapped 0 times!!!")
    }
    
}

