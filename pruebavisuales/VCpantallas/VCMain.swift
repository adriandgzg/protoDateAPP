//
//  VCMain.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class VCMain: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var viewContentTitle: UIView!

    var nameCell = "CountriesCollectionViewCell"
    @IBOutlet weak var collectionViewCountries: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContentTitle.backgroundColor = UIColor.clear
    
        
        collectionViewCountries.register(UINib(nibName:nameCell, bundle: nil), forCellWithReuseIdentifier: nameCell)
            collectionViewCountries.dataSource = self
    
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        
        collectionViewCountries.collectionViewLayout = layout
        
    }
    
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 0.1
        let size = CGSize(width: collectionViewCountries.frame.size.width - 40, height: collectionViewCountries.frame.size.height)
        layout.itemSize = size
        
        return layout
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Implementacionde delegado de Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CountriesCollectionViewCell = collectionViewCountries.dequeueReusableCell(withReuseIdentifier: nameCell, for: indexPath) as! CountriesCollectionViewCell
        
            cell.imgCountry.image = UIImage(named:"hombre")
        
            cell.lblNameCountry.text = "España"
            cell.lblDescriptionCountry.text =  "Lugar del otro lado del continente"
        
            cell.imgCountry.contentMode = .scaleAspectFill
            cell.layer.cornerRadius = 10
        
        //aqui nos pide la celda el collection view
        return cell
    }
    
    

}
