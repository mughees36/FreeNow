//
//  NWError.swift
//  DevCrew
//
//  Created by Mughees Mustafa on 02/11/2020.
//  Copyright © 2020 Mughees Mustafa. All rights reserved.
//

import Foundation
enum NetworkError: Error {
   
    case badUrl
    case notConnectedToInternet
    case decodingFailed
    case requestFailed
    case queryEncodingFailed
}
