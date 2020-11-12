//
//  MainVC.swift
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//

import UIKit


class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMapView(_ sender: Any) {
        
        let mapVC = MapVC.instantiateFromStoryboard()
        self.navigationController?.pushViewController(mapVC, animated: true)
        
    }
    
    @IBAction func btnListView(_ sender: Any) {
        
        let listViewVC = TaxisListVC.instantiateFromStoryboard()
        self.navigationController?.pushViewController(listViewVC, animated: true)
        
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
