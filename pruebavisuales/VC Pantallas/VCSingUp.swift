//
//  VCSingUp.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCSingUp: UIViewController {

    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtrepassword: UITextField!
    @IBOutlet weak var txtmail: UITextField!
    
    
    
    @IBOutlet weak var btnCrearcuenta: UIButton!
    @IBOutlet weak var btnfacebook: UIButton!
    @IBOutlet weak var viewvista: UIView!

    override func viewWillAppear(_ animated: Bool) {
        
        txtpassword.text = nil
        txtrepassword.text = nil
        txtusername.text = nil
        txtmail.text = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain , target: nil, action: nil)
    self.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    viewvista.layer.cornerRadius = 10
    btnCrearcuenta.layer.cornerRadius = 10
    btnfacebook.layer.cornerRadius = 5

        imagenalaizquierda(textfiel: txtusername, imagenes: #imageLiteral(resourceName: "user-1"))
        imagenalaizquierda(textfiel: txtpassword, imagenes:#imageLiteral(resourceName: "cand"))
        imagenalaizquierda(textfiel: txtrepassword, imagenes: #imageLiteral(resourceName: "cand"))
        imagenalaizquierda(textfiel: txtmail, imagenes: #imageLiteral(resourceName: "mail"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Imagen a la izquierda en el textfield
    func imagenalaizquierda (textfiel : UITextField, imagenes : UIImage){
        
        let imagenizquierda = UIImageView (frame: CGRect(x: 0.0 , y : 0.0 , width : imagenes.size.width, height: imagenes.size.height))
        imagenizquierda.image = imagenes
        textfiel.leftView = imagenizquierda
        textfiel.leftViewMode = .always
    }

   
    @IBAction func btnentrarconfacebook(_ sender: Any) {
       // performSegue(withIdentifier: "signup", sender: nil)
    }
    
    
    @IBAction func btnSingUp(_ sender: Any) {
        
        if txtpassword.text != txtrepassword.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: txtmail.text!, password: txtrepassword.text!){ (user, error) in
                if error == nil {
                    
                    let alertController = UIAlertController(title: "¡Registro Correcto!", message: "Tu cuenta se ha creado correctamente", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "Guardar", style: .cancel) { action in self.performSegue(withIdentifier: "signup", sender: self) }
                    
                alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)

                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    
    
}
