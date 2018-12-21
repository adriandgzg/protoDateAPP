//
//  TVCell.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 05/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCell: UITableViewCell {
 
    
    
    @IBOutlet weak var TCImage: UIImageView!
    @IBOutlet weak var TCLlb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
