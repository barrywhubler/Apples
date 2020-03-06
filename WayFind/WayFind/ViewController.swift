//
//  ViewController.swift
//  WayFind
//
//  Created by Barry Hubler on 3/5/20.
//  Copyright © 2020 Barry Hubler. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var LatitudeLabel: UILabel!
    
    var manager = CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.distanceFilter = kCLHeadingFilterNone
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthoration()
        manger.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            LatitudeLabel.text = String(location.coordinate.latitude)
            longitudeLabel.text = String(location.coordinate.longitude)
            print (String(location.coordinate.latitude))
            print (String(location.coordinate.longitude))
            print("test")
            }
        }
    func locationManager(_manager: CLLocationManager, didFailWithError error: Error) {
        print ("Error")
    }

}

