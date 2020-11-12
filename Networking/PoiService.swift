//
//  PoiService.swift
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//

import Foundation
class PoiService:NSObject {
    
    let networkService = NetworkService.shared
    
  
    
    func fetchPoiList(callback: @escaping (Result<Poi, NetworkError>) -> Void ) {
        
        networkService.getRequestWithUrl(urlStr: APIEndPoint.poi) { (result) in
            switch result {
            case .success(let data):
                print(data)
                do {
                    let model = try JSONDecoder().decode(Poi.self, from: data)
                    callback(.success(model))
                } catch {
                    print("Decoding error occured in \(#function), error: \(error.localizedDescription)")
                    callback(.failure(.decodingFailed))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
