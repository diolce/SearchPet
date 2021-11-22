//
//  MapOrganizationsViewController.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 20/11/21.
//

import UIKit
import MapKit

class MapOrganizationsViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var initLocation: CLLocationCoordinate2D!
    var coordinator: SecondCoordinator?
    let child = SpinnerViewController()
    var viewModel: MapOrganizationsViewModel = MapOrganizationsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Define the first location
        self.initLocation = CLLocationCoordinate2D(latitude: 40.778532, longitude: -73.957451)
        
        self.setDelegates()
        
        self.initViewModelMapOrganization()
        //AddGesture Search by tapping the map
        self.addGestures()
    }
    
    func setDelegates() {
        self.mapView.delegate = self
    }
    
    func addGestures() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
    }

    func initViewModelMapOrganization() {
        self.viewModel.updateLoadingStatus = {[weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                self?.spinner(childSpinner:self!.child,status:isLoading)
            }
        }
        
        self.viewModel.reloadMap = {[weak self] () in
            DispatchQueue.main.async {
                for i in self!.viewModel.itemsAnnotations {
                    self!.coordinates(forAddress: i.address) {coordinates in
                        if let coordinates = coordinates {
                            let annotationOrganization = AnnotationOrganization(name: i.name, email: i.email, phone: i.phone, coordinate: coordinates)
                            self?.setPinUsingMKAnnotation(annotationOrganization: annotationOrganization)
                        }
                    }
                }
            }
        }
        
        self.viewModel.setRegion = {[weak self] () in
            DispatchQueue.main.async {
                self?.setRegion(location: (self?.viewModel.location)!)
            }
        }
        
        self.viewModel.getOrganizations(location: self.initLocation)
    }
    
    func setRegion(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: 150000, longitudinalMeters: 150000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func setPinUsingMKAnnotation(annotationOrganization:AnnotationOrganization) {
        let pin1 = MapPin(annotationOrganization: annotationOrganization)
        mapView.addAnnotations([pin1])
    }

    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        self.viewModel.getOrganizations(location: coordinate)
    }
}

extension MapOrganizationsViewController: MKMapViewDelegate {
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
      let Identifier = "Pin"
      let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)
      annotationView.canShowCallout = true
      if annotation is MKUserLocation {
         return nil
      } else if annotation is MapPin {
         annotationView.image = UIImage(named: "Pin")
         return annotationView
      } else {
         return nil
      }
   }
}
