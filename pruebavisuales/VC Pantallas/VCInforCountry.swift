//
//  VCInforCountry.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 03/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCInforCountry: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var CountryinsidecollectionView: UICollectionView!
    var nombredecelda = "InsideaCountry"
    var datosarecibir : PAIS?
   
    
    @IBOutlet weak var checkIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain , target: nil, action: nil)
    self.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        lblNombre.text = datosarecibir?.NombrePais
        lblDescripcion.text = datosarecibir?.DescripcionPais
        
        CountryinsidecollectionView.showsHorizontalScrollIndicator = false
        
        CountryinsidecollectionView.register(UINib(nibName: nombredecelda, bundle: nil), forCellWithReuseIdentifier: nombredecelda)
        
        CountryinsidecollectionView.dataSource = self
        CountryinsidecollectionView.delegate = self
        
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        CountryinsidecollectionView.collectionViewLayout = layout
    }
    
    @IBAction func clickCheckIn(_ sender: Any) {
        
        lblCheckIn.isHidden = false
    }
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        let size = CGSize(width: CountryinsidecollectionView.frame.size.width - 150, height: CountryinsidecollectionView.frame.size.height)
        layout.itemSize = size
        
        return layout
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    performSegue(withIdentifier: "invitation", sender: nil)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (datosarecibir?.pueblos.count)!

    }
    
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
     let celdaCountry : InsideaCountry = CountryinsidecollectionView.dequeueReusableCell(withReuseIdentifier: nombredecelda, for: indexPath) as! InsideaCountry
    
    celdaCountry.Image.image = datosarecibir?.pueblos[indexPath.row].foto
    celdaCountry.lblNombre.text = datosarecibir?.pueblos[indexPath.row].NombrePais
    celdaCountry.layer.cornerRadius = 10
    
    
    return celdaCountry
    }
    

}
