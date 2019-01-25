//
//  VCShowSelection.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 31/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCShowSelection: UIViewController {

    @IBOutlet weak var imgPaisSelec: UIImageView!
    @IBOutlet weak var lblNamePaisSelec: UILabel!
    @IBOutlet weak var lblDescPaisSelec: UILabel!
    
    var datosseleccionados : PAIS?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain , target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        

        imgPaisSelec.image = datosseleccionados?.foto
        lblNamePaisSelec.text = datosseleccionados?.NombrePais
        lblDescPaisSelec.text = datosseleccionados?.DescripcionPais
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnshowinfor(_ sender: Any) {
        self.performSegue ( withIdentifier: "showinfor", sender: datosseleccionados )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showinfor"{
            if let datosselecInfor = segue.destination as? VCInforCountry {
                
                if let datosenviar = sender as? PAIS {
                    datosselecInfor.datosarecibir = datosenviar
                }
            }
        }
    }
    @IBAction func funcback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
