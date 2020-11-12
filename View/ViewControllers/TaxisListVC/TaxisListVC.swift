//
//  TaxisListVC.swift
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//

import UIKit
import JGProgressHUD


class TaxisListVC: UIViewController {

    let presenter = PoiPresenter(poiService: PoiService.init())
    let hud = JGProgressHUD()
    
    var arrPoiList:[PoiList] = [PoiList]()
    let cellID = String.init(describing: CellTaxisList.self)

    
    @IBOutlet weak var tblTaxis: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List View"
        
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        presenter.setViewDelegate(poiDelegate: self)
        presenter.fetchPoiList()

        // Do any additional setup after loading the view.
    }
    

   

}


extension TaxisListVC: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrPoiList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tblTaxis.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CellTaxisList
        
        let poiObj = self.arrPoiList[indexPath.row]
        cell.loadCellData(poiListObj: poiObj)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200.0
        
    }
    
    
    
    
    
}

extension TaxisListVC: PoiDelegate {
    
    func displayTaxisWith(poiList: [PoiList]) {
     
        self.arrPoiList = poiList
        DispatchQueue.main.async {
        
            self.tblTaxis.reloadData()
            self.hud.dismiss()

        }
        
        
            
        
        
        
    }
    
    func showErrorAlert(description: String) {
        showErrorAlert(title: Constant.Appname, description: description)
    }
    
    
    
    
}
