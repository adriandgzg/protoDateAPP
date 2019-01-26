//
//  Ciudades.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 04/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class Lugar: NSObject {
    
        var titulo:String
        var imgPlace:String
        
    override init(){
            
            titulo = "sin titulo"
            imgPlace = ""
        }
    }
    
class itemCarrousel: NSObject {
    
        var titulo : String
        var arrLugares :[Lugar]
    
    override init(){
            
            titulo = "sin titulo"
            arrLugares = []
        }
    }


class Ciudades : NSObject {
        var delegate: finishLoadDataDelegate?
        var arrCarruseles: [itemCarrousel]
        var arrFeatures: [Lugar]
    
    
    override init(){
            arrCarruseles = []
            arrFeatures  = []
        }
    
   func soloLugares() -> [Lugar] {
        var arrayLugares = [Lugar]()
    
        arrayLugares = arrFeatures
        for itemcarrusel in arrCarruseles {
        arrayLugares = arrayLugares + itemcarrusel.arrLugares
    
        }
        
        return arrayLugares
    }
 
    
    //Crear una variable con la URL dada
    func obtendatos(){
        
        ///let urlString : String = "https://api.myjson.com/bins/mwvh0=json"
        let urlString: String = "https://api.myjson.com/bins/12pmc0"
        
        //Comprueba la condicion y (solo si es falso), se ejecuta la condicion
        guard let url = URL(string: urlString) else { return }
            
        /*
         Crea una tarea que recupera el contenido de una URL especificada y lo pone en una variable data. llama a un controlador al finalizar.
         
         func dataTask(with: URL, completionHandler: (Data?, URLResponse?, Error?)
         */
            URLSession.shared.dataTask(with: url) {(data,_ , err) in
            DispatchQueue.main.async {
                if err != nil {
                    print("fallo al obtener datos de la url")
                    return
                }
                
                //contenido de URL en la variable data
                guard let data = data else { return }
                
                /* En do intenta deserealizar, sí puede, la información se queda en resultJason.
                 Se le asigna el dato a result2, que es un tipo Diccionario
                 este recibe: un String y otro tipo cualquiera de dato
                 */
                do{
                    let resultJson = try JSONSerialization.jsonObject(with: data)
                    let result2 : Dictionary = resultJson as! Dictionary<String,Any?>
                    self.consumeLugares(dictionary: result2)
                    
                }catch let jsonErr{
                    print("Fallo al decodificar jsonErr: \(jsonErr)")
                }
            }
            }.resume()
         }
        /*Funcion que recibe un tipo de informacion que es un diccionario, esa informacion se le asigna arriba en
         consumeLugares(dictionary: result2)*/
        
        func consumeLugares(dictionary : Dictionary <String,Any?>)
        {
            let ciudad = Ciudades ()
            
            for item in dictionary["arrCarrousel"] as! [Dictionary<String,Any?>]
            {
                let itemcarrusel1 = itemCarrousel ()
                itemcarrusel1.titulo = item["titulo"] as! String
                print(itemcarrusel1.titulo)
                
                for item2 in item["lugares"] as! [Dictionary<String,Any?>]
                {
                    let lugaresfinales = Lugar ()
                    lugaresfinales.titulo = item2["tituloLugar"] as! String
                    lugaresfinales.imgPlace = item2["imgPlace"] as! String
                    
                    itemcarrusel1.arrLugares.append(lugaresfinales)
                    itemcarrusel1.arrLugares.append(lugaresfinales)
                }
                
                
                ciudad.arrCarruseles.append(itemcarrusel1)
                
            }
            
            for item2 in dictionary ["arrFeatures"] as! [Dictionary<String,Any?>]
            {
                
                let lugaresfinales = Lugar ()
                lugaresfinales.titulo = item2["tituloLugar"] as! String
                lugaresfinales.imgPlace = item2["imgPlace"] as! String
                
                
                ciudad.arrFeatures.append(lugaresfinales)
            }
         
    
            //ya termino de leer todo
            delegate?.cargaFinal(ciudades: ciudad)
            
        }
        
    }
    



    






