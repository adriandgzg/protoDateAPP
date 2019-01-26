//
//  ViewController.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//


import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btnLogIn: UIButton!
    
    @IBOutlet weak var btnSingUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogIn.layer.cornerRadius = 10
        btnSingUp.layer.cornerRadius = 10
        
        
        self.navigationController?.isNavigationBarHidden = true
        
  
        self.btnLogIn.applyGradient(withColours:degreeColorGeneric(), gradientOrientation: .horizontal)
        
        self.btnSingUp.applyGradient(withColours:degreeColorGeneric(), gradientOrientation: .horizontal)
        
     
        }
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
    
    
}

