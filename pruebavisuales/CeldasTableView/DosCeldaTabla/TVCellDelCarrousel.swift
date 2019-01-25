//
//  TableViewCell.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 07/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCellDelCarrousel: UITableViewCell, UICollectionViewDelegate , UICollectionViewDataSource{
    
    var DelegateClick : carrouselItemDelegate?
    var selectCelda = 0
    var arrDatosDelCarrusel: itemCarrousel?
    
    @IBOutlet weak var mycollection: UICollectionView!
    
    @IBOutlet weak var lblTitulodeCarrusel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mycollection.delegate = self
        self.mycollection.dataSource = self
        
        self.mycollection.register(UINib(nibName:"CVCellDeCarrousel", bundle: nil), forCellWithReuseIdentifier: "CVCellDeCarrousel")
        
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        mycollection.collectionViewLayout = layout
        mycollection.showsHorizontalScrollIndicator = false
        self.textLabel?.text = arrDatosDelCarrusel?.titulo
    }

    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        let cellsize = CGSize (width: 120, height: 110)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 1
        //let size = CGSize(width: mycollection.frame.size.width - 80, height: mycollection.frame.size.height - 80)
        layout.itemSize = cellsize
        
        
        
        return layout
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (arrDatosDelCarrusel?.arrLugares.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CVCellDeCarrousel = mycollection.dequeueReusableCell(withReuseIdentifier: "CVCellDeCarrousel", for: indexPath) as! CVCellDeCarrousel
        
        cell.lblcelda.text = arrDatosDelCarrusel?.arrLugares[indexPath.row].titulo
        cargaImagenFromUrl(uiImage: cell.imgcelda , UrlImage: (arrDatosDelCarrusel?.arrLugares[indexPath.row].imgPlace)!)

        cell.imgcelda.sizeToFit()
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        selectCelda = indexPath.row
        let datosselectCelda = arrDatosDelCarrusel?.arrLugares[selectCelda]
        DelegateClick?.ClickItemCarrousel(placetoClick: datosselectCelda!)
        
        //print(datosselectCelda?.titulo)
    }
    
    
    func cargaImagenFromUrl(uiImage: UIImageView, UrlImage : String){
        
        let url = URL(string: UrlImage)
        
        URLSession.shared.dataTask(with: url!, completionHandler: {(Data,_ , err) in
            
            if err != nil {
                print("Error al obtener los datos de la imagen: " + err.debugDescription)
                return
            }
            
            DispatchQueue.main.async {
                uiImage.image = UIImage(data: Data!)!
            }
            
        }).resume()
        
    }
}
