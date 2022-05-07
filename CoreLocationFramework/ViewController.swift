//
//  ViewController.swift
//  CoreLocationFramework
//
//  Created by Ömer Faruk Kılıçaslan on 7.05.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var enlemLabel: UILabel!
    @IBOutlet weak var hizLabel: UILabel!
    @IBOutlet weak var boylamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum:CLLocation = locations[locations.count - 1]
        enlemLabel.text = "Enlem : \(sonKonum.coordinate.latitude)"
        boylamLabel.text = "Boylam : \(sonKonum.coordinate.longitude)"
        hizLabel.text = "Hız : \(sonKonum.speed)"
    }
}
