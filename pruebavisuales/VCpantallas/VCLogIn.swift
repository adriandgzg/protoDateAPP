//
//  VCLogIn.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class VCLogIn: UIViewController {
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var viewvista: UIView!
    @IBOutlet weak var btncrearcuenta: UIButton!
    @IBOutlet weak var btnfacebook: UIButton!
    
    
    override func
        
        
        viewDidLoad() {
        super.viewDidLoad()
        
        viewvista.layer.cornerRadius = 10
        btncrearcuenta.layer.cornerRadius = 10
        btnfacebook.layer.cornerRadius = 5
        
        imagenalaizquierda(textfiel: txtusername, imagenes: #imageLiteral(resourceName: "images"))
        imagenalaizquierda(textfiel: txtpassword, imagenes: #imageLiteral(resourceName: "images"))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  Imagen a la izquierda en el textfield
    func imagenalaizquierda (textfiel : UITextField, imagenes : UIImage){
        
        let imagenizquierda = UIImageView (frame: CGRect(x: 0.0 , y : 0.0 , width : imagenes.size.width, height: imagenes.size.height))
        imagenizquierda.image = imagenes
        textfiel.leftView = imagenizquierda
        textfiel.leftViewMode = .always
    }
    
    
    @IBAction func btnentrarconfacebook(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: self)
    }
    
}
