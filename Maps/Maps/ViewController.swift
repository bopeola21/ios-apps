//
//  ViewController.swift
//  Maps
//
//  Created by Jide Opeola on 2/2/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//


// Homework

// - make the map view show your current location (not as an annotation, but as the blue dot)
// - make the "annotation view" show using "title" on an annotation (make the title be the name of the venue)
// - make the mapview zoom to the annotations (maybe look for a way to make a region based on the annotations)
// - change the pin color

import UIKit
import MapKit
import CoreLocation

var onceToken: dispatch_once_t = 0

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var lManager = CLLocationManager()
    var mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.delegate = self
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        
        view.addSubview(mapView)
        
        lManager.requestWhenInUseAuthorization()
        
        lManager.delegate = self
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        lManager.distanceFilter = kCLDistanceFilterNone
        
        lManager.pausesLocationUpdatesAutomatically = true
        
        
        lManager.distanceFilter = 1000
        
        lManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        

        
        dispatch_once(&onceToken) { () -> Void in
            
      //      println(locations.last)
            
            
            
            if let location = locations.last as? CLLocation {
                
     //           self.mapView.centerCoordinate = location.coordinate
                
            // span 0.1 is in degrees
                
            let span = MKCoordinateSpanMake(0.1, 0.1)
                
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
                
            self.mapView.setRegion(region, animated: true)
                
            let venues = FourSquareRequest.requestVenuesWithLocation(location)
                
                self.createAnnotationsWithVenues(venues)
                self.userLocation()
                

                
                // request to foursquare for venues with location
            //    println(venues)
            
            
            
        }
    }
        
        lManager.stopUpdatingLocation()
    }

    
    func createAnnotationsWithVenues(venues: [AnyObject]) {
        
        for venue in venues as! [[String:AnyObject]] {
            
            let locationInfo = venue["location"] as! [String:AnyObject]
            let venueName = venue["name"] as! String
            
            let lat = locationInfo["lat"] as! CLLocationDegrees
            let lng = locationInfo["lng"] as! CLLocationDegrees
            
        //    CLLocationCoordinate2D c2D = CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude);
            
            let locValue:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
            let span = MKCoordinateSpanMake(0.01, 0.01)
            
            let region = MKCoordinateRegion(center: locValue, span: span)
            
            let coordinate =  CLLocationCoordinate2DMake(lat, lng)
            self.mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
        //    annotation.setCoordinate(coordinate)
            annotation.title = venueName
            
            
            mapView.addAnnotation(annotation)
            
        }
        
        
    }
    
    func userLocation() {
        
     //   let userL = MKUserLocation. as CLLocationDegrees
        
        var centre = mapView.centerCoordinate as CLLocationCoordinate2D
        
    let locValue:CLLocationCoordinate2D = lManager.location.coordinate
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
    //    annotation.setCoordinate(locValue)
        
    //    myPinView.pinColor = MKPinAnnotationColor.Purple;
        
  //     annotation.
        
        let myPin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "MyIdentifier")
        myPin?.pinColor = .Green
    //    return myPin
        
        mapView.addAnnotation(annotation)
    
        
   //     println("locations = \(locValue.latitude) \(locValue.longitude)")
  //     MKUserLocation.
        
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
            if annotation is MKUserLocation {
                //return nil so map view draws "blue dot" for standard user location
                return nil
            }
            
            let reuseId = "pin"
            
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = .Purple
            }
            else {
                pinView!.annotation = annotation
            }
            
            return pinView
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

