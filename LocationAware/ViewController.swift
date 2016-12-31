//
//  ViewController.swift
//  LocationAware
//
//  Created by VEERASEKHAR ADDEPALLI on 30/12/16.
//  Copyright © 2016 VEERASEKHAR ADDEPALLI. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    
    @IBOutlet var latitudeLabel: UILabel!
    
    @IBOutlet var longitudeLabel: UILabel!
    
    
    @IBOutlet var courseLabel: UILabel!
    
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
       
        
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        self.latitudeLabel.text = String(location.coordinate.latitude)
        self.longitudeLabel.text = String(location.coordinate.longitude)
        
        self.courseLabel.text = String(location.course)
        self.speedLabel.text = String(location.speed)
        self.altitudeLabel.text = String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {
        
            (placemarks,error) -> Void in
            
            if error != nil
            {
                print(error)
                
            }
            else
            {
                if let placemark = placemarks?[0]{
                    var address = ""
                    if placemark.subThoroughfare != nil{
                        address += placemark.subThoroughfare! + "  "
                    }
                    
                    
                    if placemark.thoroughfare != nil{
                        address += placemark.thoroughfare! + "\n"
                    }
                    
                    
                    if placemark.subLocality != nil{
                        address += placemark.subLocality! + "\n"
                    }
                    
                    
                    
                    if placemark.subAdministrativeArea != nil {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    
                    if placemark.postalCode != nil{
                        address += placemark.postalCode! + "\n"
                    }
                    
                   
                    
                    if placemark.country != nil{
                        address += placemark.country! + "\n"
                    }

                    self.addressLabel.text = address
                }
            }
        
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

