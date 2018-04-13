//
//  ViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 11/15/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit
import MapKit


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Artwork else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Artwork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var offlineStackView: UIStackView!
    
    @IBAction func switchImagesOfMaps(_ sender: Any) {
        switch ((sender as AnyObject).selectedSegmentIndex) {
        case 0:
            imageOfMap.image = UIImage(named: "store")
        case 1:
            imageOfMap.image = UIImage(named: "mapOne")
        case 2:
            imageOfMap.image = UIImage(named: "mapTwo")
        default:
            break
        }
    }
    
    @IBOutlet var imageOfMap: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self

        if Reachability.isConnectedToNetwork(){
            offlineStackView.isHidden = true
            mapView.isHidden = false
        }else{
            offlineStackView.isHidden = false
            mapView.isHidden = true
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 36.54052, longitude: -4.627483)
        let regionRadius: CLLocationDistance = 500
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        
        let artwork = Artwork(title: "SmartRepair.es",
                              locationName: "Our Store",
                              discipline: "store",
                              coordinate: CLLocationCoordinate2D(latitude: 36.540234, longitude: -4.627388999999994))
        mapView.addAnnotation(artwork)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

