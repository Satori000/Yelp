//
//  MapViewController.swift
//  Yelp
//
//  Created by Shakeeb Majid on 7/12/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var businesses: [Business]!

    override func viewDidLoad() {
        super.viewDidLoad()
        //37.785771,-122.406165
        
        // Do any additional setup after loading the view.
        
        
        
        /*
         "location": {
         "address": [
         "523 Broadway"
         ],
         "city": "San Francisco",
         "coordinate": {
         "latitude": 37.7978994,
         "longitude": -122.4059649
         },
         "country_code": "US",
         "cross_streets": "Romolo Pl & Kearny St",
         "display_address": [
         "523 Broadway",
         "North Beach/Telegraph Hill",
         "San Francisco, CA 94133"
         ],
         "geo_accuracy": 9.5,
         "neighborhoods": [
         "North Beach/Telegraph Hill",
         "Chinatown"
         ],
         "postal_code": "94133",
         "state_code": "CA"
         }
 
 
 
 
 
        */
        let centerLocation = CLLocation(latitude: 37.785771, longitude: -122.406165)
        goToLocation(centerLocation)
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            for business in businesses {
                print(business.name!)
                self.addAnnotationForBusiness(business)
                
                //print(business.address!)
            }
        })

        
    }
    
    
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    func addAnnotationForBusiness(business: Business) {
        let annotation = MKPointAnnotation()
        let coordinates = business.coordinates
        let latitude = coordinates!["latitude"] as! Double
        let longitude = coordinates!["longitude"] as! Double
        let actualCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.coordinate = actualCoordinates
        annotation.title = business.name!
        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
