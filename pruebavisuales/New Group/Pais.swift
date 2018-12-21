//
//  ImagenesyDescripcion.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 31/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class PAIS: NSObject {
    
    var foto : UIImage
    var DescripcionPais : String
    var NombrePais : String
    var pueblos : [PAIS]
    
    
    override init () {
        DescripcionPais = ""
        NombrePais = ""
        foto = UIImage ()
        pueblos = [PAIS] ()
    }
    
    
    init (DescripcionPais : String, NombrePais : String , foto : UIImage)
    {
        self.DescripcionPais = DescripcionPais
        self.NombrePais = NombrePais
        self.foto = foto
        self.pueblos = [PAIS] ()
    }

    
    static func arraydeinformacion() -> [PAIS]{
        var inforpais : [PAIS] = []
        
        let LaSanta = PAIS ()
        LaSanta.NombrePais = "La Santa"
        LaSanta.DescripcionPais = "Llega la noche y la esquina de Masaryk y Tennyson se llena de gente, hacia el cielo irradia el nombre del club en letras rojas y brillantes con una aureola angelical sobre la S."
        LaSanta.foto = UIImage(named: "LaSanta")!
        
            let Manaos = PAIS ()
            Manaos.NombrePais = "Jose"
            Manaos.DescripcionPais = "Al cruzar la puerta negra de la entrada, la creación de los arquitectos Emmanuel Picault y Ludwig Godefroy contrasta con la descuidada fachada exterior."
            Manaos.foto = UIImage(named:"Persona1")!
        
            let Curitiva = PAIS ()
            Curitiva.NombrePais = "Pedro"
            Curitiva.DescripcionPais = "Es una ciudad colonial"
            Curitiva.foto = UIImage(named:"Persona2")!
        
            let Manaos2 = PAIS ()
            Manaos2.NombrePais = "Joaquin"
            Manaos2.DescripcionPais = "Es una ciudad colonial"
            Manaos2.foto = UIImage(named:"Persona3")!
        
            let Curitiva2 = PAIS ()
            Curitiva2.NombrePais = "Sofia"
            Curitiva2.DescripcionPais = "Es una ciudad colonial"
            Curitiva2.foto = UIImage(named:"Persona4")!
    
        let España = PAIS ()
        España.NombrePais = "ESPAÑA"
        España.DescripcionPais = "Es famosa por sus calles"
        España.foto = UIImage(named: "C5")!
        
            let Madrid = PAIS ()
            Madrid.NombrePais = "MADRID"
            Madrid.DescripcionPais = "Es famosa por sus calles"
            Madrid.foto = UIImage(named:"C3")!
        
            let Sevilla = PAIS ()
            Sevilla.NombrePais = "SEVILLA"
            Sevilla.DescripcionPais = "Es famosa por sus calles"
            Sevilla.foto = UIImage(named:"C4")!

        let Islandia = PAIS ()
        Islandia.NombrePais = "ISLANDIA"
        Islandia.DescripcionPais = "Los extranjeros viajan a Chiang"
        Islandia.foto = UIImage(named: "islandia")!
        
            let Dalvik = PAIS ()
            Dalvik.NombrePais = "DALVIK"
            Dalvik.DescripcionPais = "Los extranjeros viajan a Chiang"
            Dalvik.foto = UIImage(named:"C5")!
        
            let Arborg = PAIS ()
            Arborg.NombrePais = "ARBORG"
            Arborg.DescripcionPais = "Los extranjeros viajan a Chiang"
            Sevilla.foto = UIImage(named:"C6")!
        
        let Suecia = PAIS ()
        Suecia.NombrePais = "SUECIA"
        Suecia.DescripcionPais = "Ubicada en el centro del país"
        Suecia.foto = UIImage(named: "suecia")!
        
            let Estocolmo = PAIS ()
            Estocolmo.NombrePais = "ESTOCOLMO"
            Estocolmo.DescripcionPais = "Ubicada en el centro del país"
            Estocolmo.foto = UIImage(named:"C7")!
        
            let Gutemburgo = PAIS ()
            Gutemburgo.NombrePais = "GUTEMBURGO"
            Gutemburgo.DescripcionPais = "Ubicada en el centro del país"
            Gutemburgo.foto = UIImage(named:"C8")!
        
        let Tailandia = PAIS ()
        Tailandia.NombrePais = "TAILANDIA"
        Tailandia.DescripcionPais = "Sus románticos puentes"
        Tailandia.foto = UIImage (named: "thailandia")!
        
            let Bangkok = PAIS ()
            Bangkok.NombrePais = "BANGKOK"
            Bangkok.DescripcionPais = "Sus románticos puentes"
            Bangkok.foto = UIImage(named:"C9")!
        
            let Pai = PAIS ()
            Pai.NombrePais = "PAI"
            Pai.DescripcionPais = "Sus románticos puentes"
            Pai.foto = UIImage(named:"C10")!
        
        let Photo1 = PAIS ()
        Photo1.foto = UIImage (named: "C1")!
        let Photo2 = PAIS ()
        Photo2.foto = UIImage (named: "C2")!
        let Photo3 = PAIS ()
        Photo3.foto = UIImage (named: "C3")!
        let Photo4 = PAIS ()
        Photo4.foto = UIImage (named: "C4")!
        let Photo5 = PAIS ()
        Photo5.foto = UIImage (named: "C5")!
        let Photo6 = PAIS ()
        Photo6.foto = UIImage (named: "C6")!
        
    
    LaSanta.pueblos.append(Manaos)
    LaSanta.pueblos.append(Curitiva)
    LaSanta.pueblos.append(Manaos2)
    LaSanta.pueblos.append(Curitiva2)
        
    España.pueblos.append(Madrid)
    España.pueblos.append(Sevilla)

    
    inforpais = [LaSanta, España , Islandia,Suecia, Tailandia, Photo1, Photo2, Photo3, Photo4, Photo5, Photo6 ]
        
        return inforpais
    }
    
    
    
    }
    

    

