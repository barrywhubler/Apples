//
//  ViewController.swift
//  sensors
//
//  Created by Barry Hubler on 3/5/20.
//  Copyright © 2020 Barry Hubler. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var valueX: UILabel!
    @IBOutlet weak var valueY: UILabel!
    @IBOutlet weak var valueZ: UILabel!
    var manager: CMMotionManager!
    
    var square = UIView!
    
    var control = false
    var delta = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.blue
        
        
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        square.center = CGPoint(x:width / 2, y: height / 2)
        square.backgroundColor = UIColor.orange
        view.addSubview(square)
        
        
        manager = CMMotionManager()
        if manager.isDeviceMotionAvailable{
            manager.deviceMotionUpdateInterval = 1.0/60.0
            let queue = OperationQueue.main
            manager.startDeviceMotionUpdates(to: queue, withHandler: {(data, error) in
                if let values = data{
                    self.valueX.text = String(values.gravity.x)
                    self.valueY.text = String(values.gravity.y)
                    self.valueZ.text = String(values.gravity.z)
                    
                    let today = Date()
                    let seconds = today.timeIntervalSince(self.delta)
                    let acc = values.userAcceleration.x
                    if seconds > 0.5 && acc > 2.0 {
                        self.delta = today
                        if self.control {
                            self.view.backgroundColor = UIColor.blue
                            self.control = false
                        }else{
                            self.view.backgroundColor = UIColor.red
                            self.control = true
                            
                        }
                    }
                    let radians = atan(values.attitude.pitch / values.attitude.roll)
                    var matrix CATransform3DIdentity
                    matrix = CATransform3dRotate(matrix, CGFloat (radians), 0,0,1)
                    self.square.layer.transform = matrix
                }
            })
        }
        
        
    }


}

