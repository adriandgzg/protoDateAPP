//
//  VCMain.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCMain: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var viewContentTitle: UIView!

    
    @IBOutlet weak var viewBackground: UIView!
    
    var celdaseleccionada : Int = 0
    var otrainfor = PAIS.arraydeinformacion()
    var nameCell = "CountriesCollectionViewCell"
    
    @IBOutlet weak var collectionViewCountries: UICollectionView!    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "" , style: UIBarButtonItemStyle.plain , target: nil, action: nil)
        
        self.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        viewContentTitle.backgroundColor = UIColor.clear
        
        collectionViewCountries.showsHorizontalScrollIndicator = false
        collectionViewCountries.register(UINib(nibName:nameCell, bundle: nil), forCellWithReuseIdentifier: nameCell)
        
            collectionViewCountries.dataSource = self
            collectionViewCountries.delegate = self
        
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        collectionViewCountries.collectionViewLayout = layout
        
        let imageName = "C1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = viewBackground.bounds
        viewBackground.addSubview(imageView)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = viewBackground.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewBackground.addSubview(blurEffectView)
       
    }
    
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40
        //layout.minimumInteritemSpacing = 0.1
        let size = CGSize(width: collectionViewCountries.frame.size.width - 100, height: collectionViewCountries.frame.size.height)
        layout.sectionInset = UIEdgeInsets (top: 0, left: 30, bottom: 0, right: 30)
        layout.itemSize = size
     
        
        return layout
        
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Implementacionde delegado de Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return otrainfor.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CountriesCollectionViewCell = collectionViewCountries.dequeueReusableCell(withReuseIdentifier: nameCell, for: indexPath) as! CountriesCollectionViewCell
        
            cell.lblNameCountry.text = otrainfor [indexPath.row].NombrePais
            cell.lblDescriptionCountry.text = otrainfor [indexPath.row].DescripcionPais
            cell.imgCountry.image = otrainfor[indexPath.row].foto
            cell.imgCountry.contentMode = .scaleAspectFill
            cell.layer.cornerRadius = 10
        
    
        //aqui nos pide la celda del collection view
        return cell
    }
 
    
    //MARK :  Mostrar la celda seleccionada
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        celdaseleccionada = indexPath.row
        let datosselec = otrainfor[celdaseleccionada]
        self.performSegue(withIdentifier: "show2", sender: datosselec)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show2"{
           
            if let datosselecInfor = segue.destination as? VCInforCountry {
                
                if let datosenviar = sender as? PAIS {
                    datosselecInfor.datosarecibir = datosenviar
                }
            }/*
            if let datosselec = segue.destination as? VCShowSelection {
    
                if let datosenviar = sender as? PAIS {
                    datosselec.datosseleccionados = datosenviar
                }
            }*/
        }
    }
    
    


    @IBAction func btnLogOut(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let inicial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = inicial
    }
    
    
    
    
    
}
 


