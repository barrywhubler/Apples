//
//  ViewController.swift
//  tgtester
//
//  Created by Barry Hubler on 2/14/20.
//  Copyright © 2020 Barry Hubler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    
    //@IBOutlet var swipeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func updateLabelsFromTouches(_ touch: UITouch?, allTouches: Set<UITouch>?){
        
        let numTaps = touch?.tapCount ?? 0
        let tapsMessage = "|(numTaps) taps detected"
        tapsLabel.text = tapsMessage
        let numTouches = allTouches?.count ?? 0
        let touchMsg = "|(numTouches) touches detected"
        touchesLabel.text = touchMsg
        
        if traitCollection.forceTouchCapability == .available {
            forceLabel.text = "Force: \(touch?.force ?? 0) \nMax force: \(touch?.maximumPossibleForce ?? 0)"
        }else{
            forceLabel.text = "#D Touch not Available"
        }
        
    }

    override func touchesBegan (_ touches: Set<UITouch>, with event: UIEvent?) { messageLabel.text = "Touches Start"
        updateLabelsFromTouches(touches.first,allTouches: event?.allTouches)
    }
    
    override func touchesCancelled (_ touches: Set<UITouch>, with event: UIEvent?){
        messageLabel.text = "Touches Stop"
        updateLabelsFromTouches (touches.first, allTouches:event?.allTouches)
    }
    
    override func touchesEnded (_ touches: Set<UITouch>, with event: UIEvent?){
        messageLabel.text = "Touches End"
        updateLabelsFromTouches (touches.first,allTouches:event?.allTouches)
    }
    
    override func touchesMoved (_ touches: Set<UITouch>, with event: UIEvent?){
        messageLabel.text = "Drag Detected"
        updateLabelsFromTouches (touches.first,allTouches:event?.allTouches)
    }
}

