//
//  ViewController.swift
//  swipeGestureTest
//
//  Created by Barry Hubler on 2/14/20.
//  Copyright © 2020 Barry Hubler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var swipeLabel1: UILabel!
    private var gestureStartPoint: CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVarience = Float(5)
    
    
    @IBOutlet weak var swipeLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            if (sender.direction == .left) {
                print("Swipe Left")
                let labelPosition = CGPoint(x: self.swipeLabel2.frame.origin.x - 50.0, y:self.swipeLabel2.frame.origin.y)
                swipeLabel2.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: self.swipeLabel2.frame.size.width, height: self.swipeLabel2.frame.size.height)
                    self.swipeLabel2.text = "left"
        }
        if (sender.direction == .right) {
            print("Swipe Right")
            let labelPosition = CGPoint(x: self.swipeLabel2.frame.origin.x + 50.0, y:self.swipeLabel2.frame.origin.y)
            swipeLabel2.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: self.swipeLabel2.frame.size.width, height: self.swipeLabel2.frame.size.height)
                self.swipeLabel2.text = "right"
        }
            
            
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
            gestureStartPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved (_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let gestureStartPoint = self.gestureStartPoint {
            let currentPosition = touch.location (in: self.view)
            let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
            let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
            
            if deltaX >= ViewController.minimumGestureLength && deltaY <= ViewController.maximumVarience {swipeLabel1.text = "Horizontal Swipe Happened"}
        }else if deltaY >= ViewController.minimumGestureLength && deltaX <= ViewController.maximumVarience {
            swipe /////42.43
        }
    }


}

