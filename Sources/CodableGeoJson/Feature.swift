//
//  Feature.swift
//  CodableGeoJson
//
//  Created by patrick on 20.12.17.
//

import Foundation

public struct Feature: GeoJSON {
    public static var type = GeoJSONType.feature
    
    public let geometry: GeoJSON?
    public let id: String?
    public let properties: Any?
    
    public enum CodingKeys : CodingKey {
        case geometry, properties, id
    }
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id  = try? container.decode(String.self, forKey: .id)
        
        
        let anyGeo = try container.decode(AnyGeoJSON.self, forKey: .geometry)
        self.geometry = anyGeo.base
        if let tempDict = try? container.decode([String:Any].self , forKey: .properties) {
          self.properties = tempDict
        } else {
            if let tempArray = try? container.decode([Any].self , forKey: .properties) {
                self.properties = tempArray
            } else {
                self.properties = nil
            }
            
        }
        
    }
    
     public func encode(to encoder: Encoder) throws {

     var container = encoder.container(keyedBy: CodingKeys.self)
     
     if let geometry = self.geometry {
        
        let anyGeo = AnyGeoJSON.init(geometry)
        try container.encode(anyGeo, forKey: .geometry)
     }
 
     
     }
    
    
    
    
}
