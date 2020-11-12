//
//  CellTaxisList.swift
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//

import UIKit

class CellTaxisList: UITableViewCell {

    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadCellData(poiListObj:PoiList){
        
        let coordinate = poiListObj.coordinate

        
        self.lblId.text = "\(poiListObj.id )"
        self.lblLat.text = "\(coordinate.latitude )"
        self.lblLong.text = "\(coordinate.longitude )"
        self.lblType.text = poiListObj.type
        self.lblStatus.text = poiListObj.state
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
