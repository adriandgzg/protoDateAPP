//
//  TableViewCell2.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 07/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCelldeImagenes: UITableViewCell {

  
    @IBOutlet weak var imagen2: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
