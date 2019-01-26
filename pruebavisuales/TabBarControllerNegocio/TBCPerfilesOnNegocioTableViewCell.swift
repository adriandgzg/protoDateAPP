//
//  TBCPerfilesOnNegocioTableViewCell.swift
//  pruebavisuales
//
//  Created by Abraham Vazquez on 1/25/19.
//  Copyright © 2019 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TBCPerfilesOnNegocioTableViewCell: UITableViewCell, UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewOnCell: UICollectionView!
  
    var widthTotal: Double = 0.0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.collectionViewOnCell.delegate = self
        self.collectionViewOnCell.dataSource = self
            
        self.collectionViewOnCell.register(UINib(nibName:"TBCPerfilesPersonasCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCellPersonas")
        
        widthTotal = Double(collectionViewOnCell.frame.size.width)
        
        let layout = self.configuraElementosEnCollectionView(myWidth: widthTotal)
        collectionViewOnCell.collectionViewLayout = layout
    
    }
    
    func configuraElementosEnCollectionView(myWidth: Double) -> UICollectionViewLayout
    {
        if myWidth != 0.0 {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 10
            let cellSize = CGSize(width: myWidth / 3, height: myWidth / 3)
            layout.itemSize = cellSize
            
            return layout
        }else{
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            return layout
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TBCPerfilesPersonasCollectionViewCell = collectionViewOnCell.dequeueReusableCell(withReuseIdentifier: "collectionCellPersonas", for: indexPath) as! TBCPerfilesPersonasCollectionViewCell
    
        cell.frame.size = CGSize(width: widthTotal / 3 , height: widthTotal / 3)
     
        
        print("\(cell)")
        
        return cell
    }
    
    
    
}
