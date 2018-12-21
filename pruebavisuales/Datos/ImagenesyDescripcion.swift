//
//  ImagenesyDescripcion.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 31/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ImagenesyDescripcion: NSObject {
    
    var foto : UIImage
    var DescripcionPais : String
    var NombrePais : String
    
    override init () {
        DescripcionPais = ""
        NombrePais = ""
        foto = UIImage ()
        
    }
        
    init (DescripcionPais : String, NombrePais : String , foto : UIImage)
    {
        self.DescripcionPais = DescripcionPais
        self.NombrePais = NombrePais
        self.foto = foto
    }

    static func arraydeinformacion() -> [ImagenesyDescripcion]{
        var lainformacion : [ImagenesyDescripcion] = []
        lainformacion.append(ImagenesyDescripcion(DescripcionPais: "Es una ciudad colonial y parte de ella fue declarada Patrimonio de la Humanidad por la Unesco", NombrePais: "BRASIL", foto: UIImage(named: "brasil")!))
       lainformacion.append(ImagenesyDescripcion(DescripcionPais: "Es famosa por sus calles de adoquines, carros de caballos y casas de colores, sobre todo en el elegante barrio francés.", NombrePais: "ESPAÑA", foto: UIImage(named: "españa")!))
        lainformacion.append(ImagenesyDescripcion(DescripcionPais: "Cuna también de centenarias fórmulas para del bienestar corporal natural, muchos extranjeros viajan a Chiang Mai a aprender técnicas como el conocido masaje tailandés.", NombrePais: "ISLANDIA", foto: UIImage(named: "islandia")!))
        lainformacion.append(ImagenesyDescripcion(DescripcionPais: "Ubicada en el centro del país, Kioto fue la capital entre los años 794 y 1868 y en ella se instaló la sede de la Corte Imperial.", NombrePais: "SUECIA", foto: UIImage(named: "suecia")!))
        
        lainformacion.append(ImagenesyDescripcion(DescripcionPais: "Además sus románticos puentes han sido testigos de miles de propuestas matrimoniales de italianos y turistas.", NombrePais: "THAILANDIA", foto: UIImage(named: "thailandia")!))
        
        
        
        
        return lainformacion
    }
    
    
    
    }
    

    

