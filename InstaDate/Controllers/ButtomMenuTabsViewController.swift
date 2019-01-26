//
//  ButtomMenuTabsViewController.swift
//  pruebavisuales
//
//  Created by Adrián Pascual Domínguez on 1/26/19.
//  Copyright © 2019 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ButtomMenuTabsViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.applyGradient(withColours: degreeColorGeneric(), gradientOrientation: .horizontal)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
