//
//  Helper.swift
//  pruebavisuales
//
//  Created by Adrián Pascual Domínguez on 1/24/19.
//  Copyright © 2019 Adrian Pascual Dominguez. All rights reserved.
//
import UIKit
import Foundation


extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

