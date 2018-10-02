//
//  ViewController.swift
//  iss
//
//  Created by Lawrence Edmondson on 1/23/18.
//  Copyright © 2018 Lawrence Edmondson. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    //UI elements
    @IBOutlet weak var locateMeButton: UIButton?
    @IBOutlet weak var viewResultsButton: UIButton?
    @IBOutlet weak var viewResultsText: UILabel?

    
    //Instance variables
    let locationManager = CLLocationManager()
    var parameters:[String: AnyObject]? = [:]

    override func viewWillAppear(_ animated: Bool) {
        self.viewResultsText?.isHidden = true
        self.viewResultsButton?.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //request authorization to access the user's location when the app is in use
        self.locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Custom logic
    
    /**
         locateMe locates the user based on their GPS Cordinates
         - parameter sender : is the sender from the UI
         - returns: void
    */
    @IBAction func locateMe(_ sender: UIButton!) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        } else {
            //handle user denying access to their location via alert
        }
    }
    
    /**
         locationManager actually performs the lookup based on CLLocationManager
         - parameter manager : CLLocationManager
         - parameter didUpdateLocations : locations array
         - returns: void
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        manager.stopUpdatingLocation()
        _ = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
        //set our lat and lon parameters once we have them
        self.parameters!["lat"] =  userLocation.coordinate.latitude as AnyObject
        self.parameters!["lon"] = userLocation.coordinate.longitude as AnyObject
        
        //toggle on the view results text and button
        self.viewResultsText?.isHidden = false
        self.viewResultsButton?.isHidden = false

    }
    
    /**
         prepare overrides the prepare for segue and essentially passes the parameters array to the TableViewController
         - parameter segue : the segue
         - parameter sender : the sender from the UI
         - returns: void
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "show_results") {
            let tableViewController = segue.destination as! TableViewController
            tableViewController.parameters = self.parameters
        }
    }

    /**
         loadResults performs the show_results segue which displays the results
         - parameter sender : is the sender from the UI
         - returns: void
     */
    @IBAction func loadResults(sender: AnyObject) {
        self.performSegue(withIdentifier: "show_results", sender: self.parameters)
    }
    

}

