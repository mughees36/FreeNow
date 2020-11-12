//
//  PoiPresenter.swift
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//



import Foundation

class PoiPresenter: NSObject {
    
    weak private var poiDelegate : PoiDelegate?
    private let poiService: PoiService
    
    
   @objc init(poiService: PoiService) {
        
        self.poiService = poiService

        
    }

    
   @objc func setViewDelegate(poiDelegate:PoiDelegate?){
        self.poiDelegate = poiDelegate
    }

    
    
    
  @objc func fetchPoiList() {
        
        let reachability = try? Reachability()
        
        
        guard ((reachability?.isConnectedToNetwork) == true) else {
            poiDelegate?.showErrorAlert(description: "Not connected to internet");
            return
        }
        poiService.fetchPoiList() {[weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let model):

                print(model)
                if model.poiList?.count ?? 0 > 0 {
                    
                    strongSelf.poiDelegate?.displayTaxisWith(poiList: model.poiList ?? [])
                }
                
                
                
                
                
            case .failure(let error):
                print("error: \(error)")
                strongSelf.poiDelegate?.showErrorAlert(description: error.localizedDescription)
            }
        }
    }
    
    
    
}
@objc protocol PoiDelegate: class {
    
    func displayTaxisWith(poiList: [PoiList])
    func showErrorAlert(description: String)
    
    
}


