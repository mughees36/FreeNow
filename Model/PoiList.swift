//
//  PoiList.swift
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//

import Foundation


class Poi: NSObject,Codable {
    
    var poiList:[PoiList]?
    
}

class PoiList: NSObject, Codable {
    
    @objc var id: Int
    @objc var coordinate:Coordinate
    @objc var state: String
    @objc var type: String
    @objc var heading: Double

    
}

class Coordinate: NSObject, Codable {
    
    @objc var latitude: Double
    @objc var longitude: Double
    
}
