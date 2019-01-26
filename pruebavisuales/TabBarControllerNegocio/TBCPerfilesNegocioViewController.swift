//
//  TBCPerfilesNegocioViewController.swift
//  pruebavisuales
//
//  Created by Abraham Vazquez on 1/24/19.
//  Copyright © 2019 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TBCPerfilesNegocioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TBCMainTableView: UITableView!
    
    //Vavarbles
    let arrTitulos = ["","",""]
    let arrRows = ["","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registro del NIB
        let nib = UINib.init(nibName: "TBCPerfilesOnNegocioTableViewCell", bundle: nil)
        self.TBCMainTableView.register(nib, forCellReuseIdentifier: "cellWithCollection")
   
    }

    //MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrTitulos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.TBCMainTableView.frame.size.width / 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TBCMainTableView.dequeueReusableCell(withIdentifier: "cellWithCollection", for: indexPath) as! TBCPerfilesOnNegocioTableViewCell        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
