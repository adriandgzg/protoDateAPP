//
//  VCMapSpot.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 11/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMapSpot: UIViewController, CLLocationManagerDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    var LugarMap = CLLocationManager()
    var datosarecibir : PAIS?

    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var ViewDesc: UIView!
    
  let direction: [UISwipeGestureRecognizerDirection] = [.up, .down]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitulo.text = datosarecibir?.NombrePais
        lblDescription.text = datosarecibir?.DescripcionPais
        image.image = datosarecibir?.foto
        
        
        for dir in direction {
           let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeView(_:)))
            ViewDesc.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = dir
            ViewDesc.isUserInteractionEnabled = true
            ViewDesc.isMultipleTouchEnabled = true
        }
       
       
        
        LugarMap.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            LugarMap.delegate = self
            LugarMap.desiredAccuracy = kCLLocationAccuracyBest
            LugarMap.startUpdatingLocation()
        }
        
        
    // Do any additional setup after loading the view.
    }
    @objc func swipeView(_ sender:UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .down {
                self.ViewDesc.frame = CGRect(x: self.view.frame.size.width - self.ViewDesc.frame.size.width, y: self.view.frame.size.height - 40, width: self.ViewDesc.frame.size.width, height: self.ViewDesc.frame.size.height)
            }else {
                self.ViewDesc.frame = CGRect(x: self.view.frame.size.width - self.ViewDesc.frame.size.width, y: self.ViewDesc.frame.size.height + 70 , width: self.ViewDesc.frame.size.width, height: self.ViewDesc.frame.size.height)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.first {
            print(location.coordinate)
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.Map.setRegion(region, animated: true)
            
            
            // Drop a pin at user's Current Location
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
            myAnnotation.title = "Current location"
            
            self.Map.addAnnotation(myAnnotation)
            
        }
    }
    
    
    @IBAction func TakePhoto(_ sender: Any) {
        //MARK: - Take image
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        image.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
        
    
}
