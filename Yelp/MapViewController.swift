//
//  MapViewController.swift
//  Yelp
//
//  Created by Shakeeb Majid on 7/12/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var businesses: [Business]!
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        //37.785771,-122.406165
        
        // Do any additional setup after loading the view.
        
        let centerLocation = CLLocation(latitude: 37.785771, longitude: -122.406165)
        goToLocation(centerLocation)
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            var i = 0
            for business in businesses {
                print(business.name!)
                self.addAnnotationForBusiness(business, tag: i)
                i += 1
                //print(business.address!)
            }
        })

        
    }
    
    
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            
            let rightButton: AnyObject! = UIButton(type: UIButtonType.DetailDisclosure)
            
            rightButton.titleForState(UIControlState.Normal)
            
            pinView!.rightCalloutAccessoryView = rightButton as! UIView
            
            for business in businesses {
                print("title: \(pinView!.annotation!.title!!)")
                if business.name! == pinView!.annotation!.title!! {
                    print("hey you reached it \(i)")
                    print("business: \(businesses[i].name!)")
                    pinView!.tag = i
                }
                i += 1

            }
            i = 0
            pinView!.tag = i
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            print(view.annotation!.title!!)
            
            var business = businesses![view.tag]
            
            performSegueWithIdentifier("toTheMoon", sender: view)
        }
    }
    
    
    func addAnnotationForBusiness(business: Business, tag: Int) {
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender is MKAnnotationView {
            print("before tag")
            //let business = businesses[sender!.tag]
            let detailVC = segue.destinationViewController as! DetailViewController

            //print("after tag \((sender as! MKAnnotationView).annotation!.title!!)")
            for business in businesses {
                if business.name! == (sender as! MKAnnotationView).annotation!.title!! {
                    detailVC.business = business
                }
                //i += 1
            }
            //i = 0
            
            //detailVC.business = business
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
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

}
