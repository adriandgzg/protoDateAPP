//
//  VCLogIn.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCLogIn: UIViewController {
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var viewvista: UIView!

    
    @IBOutlet weak var btncrearcuenta: UIButton!
    @IBOutlet weak var btnfacebook: UIButton!
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        txtusername.text = nil
        txtpassword.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain , target: nil, action: nil)
        

        viewvista.layer.cornerRadius = 10
        btncrearcuenta.layer.cornerRadius = 10
        btnfacebook.layer.cornerRadius = 5
        
        imagenalaizquierda(textfiel: txtusername, imagenes: #imageLiteral(resourceName: "user-1"))
        imagenalaizquierda(textfiel: txtpassword, imagenes: #imageLiteral(resourceName: "cand"))
        
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
       // performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func btnCrearcuenta(_ sender: Any) {

        if self.txtusername.text == "" || self.txtpassword.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Por favor introduce email y contraseña", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            //2.
            Auth.auth().signIn(withEmail: self.txtusername.text!, password: self.txtpassword.text!) { (user, error) in
                //3.
            if error == nil {
            self.performSegue(withIdentifier: "login", sender: self)
                } else {
                    //4.
            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
            self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    
    }
    
 
    
    
}
