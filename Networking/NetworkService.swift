//
//  NetworkService.swift
//  DevCrew
//
//  Created by Mughees Mustafa on 02/11/2020.
//  Copyright © 2020 Mughees Mustafa. All rights reserved.
//

import Foundation
class NetworkService {
    private init() { }
    static let shared = NetworkService()
    
    func getRequestWithUrl(urlStr: String, callback: @escaping (Result<Data, NetworkError>) -> Void ) {
        
        guard let urlComponents = URLComponents(string: urlStr) else {
            callback(.failure(.badUrl)); return
        }
        
        guard let url = urlComponents.url else {
            callback(.failure(.badUrl)); return
        }
        
        let request = NSMutableURLRequest.init(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, taskError) in
            if let error = taskError  {
                
                print("error occured in dataTask, urlStr: \(urlStr)" + "\nerror:  \(error)")
                let jsonString = try? JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                print(jsonString as Any)
                callback(.failure(.requestFailed))
                
            } else if let data = data {
                
                callback(.success(data))
            }
        }
        dataTask.resume()
    }
}
