//
//  Protocolos.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 10/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import Foundation

protocol carrouselItemDelegate {
    func ClickItemCarrousel ( placetoClick : Lugar)
}

protocol finishLoadDataDelegate{
    func cargaFinal(ciudades:Ciudades)
}
