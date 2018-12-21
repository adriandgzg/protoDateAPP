//
//  VCExplore.swift
//  pruebavisuales
//
//  Created by Adrian Pascual Dominguez on 06/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCExplore: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, carrouselItemDelegate, finishLoadDataDelegate {

    
    var buscando = false
    var selectCelda = 0
    var ciudades: Ciudades?
    var resultadoBusqueda = [Lugar]()
    
    @IBOutlet weak var TableViewExplore: UITableView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var collectionnombrecelda = "TVCellDelCarrousel"
    var nombreimagen = "TVCelldeImagenes"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain , target: nil, action: nil)
    self.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    ciudades = Ciudades()
    ciudades?.obtendatos()
    ciudades?.delegate = self
        
    self.title = "Explore"
        
    TableViewExplore.delegate = self
    TableViewExplore.dataSource = self
    searchbar.delegate = self
    
    TableViewExplore.register(UINib(nibName: collectionnombrecelda, bundle: nil), forCellReuseIdentifier: collectionnombrecelda )
        
    TableViewExplore.register(UINib(nibName: nombreimagen, bundle: nil), forCellReuseIdentifier: nombreimagen )
    
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if buscando {
            return resultadoBusqueda.count
        }
        
        else {
        if section == 0 {
                return (ciudades?.arrCarruseles.count)!
            }
            else {
                
                return (ciudades?.arrFeatures.count)!
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if buscando {
            let celda = tableView.dequeueReusableCell(withIdentifier: nombreimagen) as! TVCelldeImagenes
            
    
            celda.lbl2.text =  resultadoBusqueda[indexPath.row].titulo
            cargaImagenFromUrl(uiImage: celda.imagen2 , UrlImage: (resultadoBusqueda[indexPath.row].imgPlace))
            celda.selectionStyle = .none
            celda.imagen2.layer.cornerRadius = 10
            return celda
            
        }
        else {
        
            if indexPath.section == 0 {
                let cell  = tableView.dequeueReusableCell(withIdentifier: collectionnombrecelda) as! TVCellDelCarrousel
        
            cell.DelegateClick = self
                
            cell.arrDatosDelCarrusel = ciudades?.arrCarruseles[indexPath.row]
                
            cell.lblTitulodeCarrusel.text = ciudades?.arrCarruseles[indexPath.row].titulo
                
                cell.selectionStyle = .none
                return cell
            
            }
            
            
            else  {
                
                let celda = tableView.dequeueReusableCell(withIdentifier: nombreimagen) as! TVCelldeImagenes
                
                
                celda.lbl2.text =  ciudades?.arrFeatures[indexPath.row].titulo
                cargaImagenFromUrl(uiImage: celda.imagen2 , UrlImage: (ciudades?.arrFeatures[indexPath.row].imgPlace)!)
                celda.selectionStyle = .none
                celda.imagen2.layer.cornerRadius = 10
              
                
                return celda
            }
    
        
        
        }
        
        
        
        
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 170.0
        }else{
            return 150.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
        selectCelda = indexPath.row
        let datosselectCelda = ciudades?.arrFeatures[selectCelda]
            
        print(datosselectCelda?.titulo)
        }
        
    }
    
    func ClickItemCarrousel(placetoClick: Lugar) {
        print ( placetoClick )
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1 {
            
            return "Featured"
        }
        else {
            
            return nil
        }
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
    
    func cargaFinal(ciudades: Ciudades) {
        self.ciudades = ciudades
        self.TableViewExplore.reloadData()
    }
 

    //UISearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text != ""  {
             buscando = true
        } else {
             buscando = false
            }
        
        
        self.resultadoBusqueda = (ciudades?.soloLugares().filter({loquesefiltro-> Bool in return loquesefiltro.titulo.lowercased().prefix(searchText.count) == searchText.lowercased()}))!
            TableViewExplore.reloadData()
            
            
    }
        
    
    
    
    
}
