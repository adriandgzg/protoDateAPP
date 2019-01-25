//
//  VCTownCities.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 04/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import  FirebaseAuth

class VCTownCities: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var ImgImagen: UIImageView!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var CView: UICollectionView!
    @IBOutlet weak var TableView: UITableView!
    
    var celdaseleccionada = 0
    var arrayfotos = PAIS.arraydeinformacion()
    var namecellCollection = "InsideaCountry"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain , target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
    lblTitulo.text = "M.ROY"
    ImgImagen.image = UIImage (named: "MROY")
    lblDescripcion.text = "Qué mejor forma de cerrar el año que con festejos navideños, sinónimo de mucha fiesta y diversión. En Licorería Limantour encontrarás a Miracle, uno de los pop-up bars más famosos del mundo donde habrá cocteles de temporada y decoraciones de Navidad."
        
        let atributoString = NSMutableAttributedString (string: lblDescripcion.text!)
        let EstiloParrafo = NSMutableParagraphStyle()
        EstiloParrafo.lineSpacing = 10
        atributoString.addAttribute(.paragraphStyle, value: EstiloParrafo, range: NSMakeRange(0, atributoString.length))
        lblDescripcion.attributedText = atributoString
    
    CView.showsHorizontalScrollIndicator = false
    CView.register(UINib(nibName: namecellCollection, bundle: nil), forCellWithReuseIdentifier: namecellCollection)
        
    TableView.showsVerticalScrollIndicator = false
    TableView.register(UINib(nibName: "TVCell", bundle: nil), forCellReuseIdentifier: "TVCell")
    
        
    CView.dataSource = self
    CView.delegate = self
    TableView.dataSource = self
    TableView.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayfotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celdaPhotos : InsideaCountry = CView.dequeueReusableCell(withReuseIdentifier: namecellCollection, for: indexPath) as! InsideaCountry
        
        celdaPhotos.Image.image = arrayfotos[indexPath.row].foto
        celdaPhotos.layer.cornerRadius = 10
        
        return celdaPhotos
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayfotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! TVCell
    
        
        cell.TCImage.image = arrayfotos[indexPath.row].foto
        cell.TCLlb.text = arrayfotos[indexPath.row].NombrePais
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        celdaseleccionada = indexPath.row
        let datos = arrayfotos[celdaseleccionada]
        
        self.performSegue(withIdentifier: "MapSpot", sender: datos)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapSpot"{
            if let datosselec = segue.destination as? VCMapSpot {
                
                if let datosenviar = sender as? PAIS {
                    datosselec.datosarecibir = datosenviar
                }
            }
        }
    }
 
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
