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
    public let properties: Any?
    
    public enum CodingKeys : CodingKey {
        case geometry, properties
    }
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
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
    /*
     public func encode(to encoder: Encoder) throws {
     if propertiesArray != nil && properties != nil {
     throw EncodingError.invalidValue(propertiesArray as Any, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Can't set properties and propertiesArray at the same time") )
     }
     var container = encoder.container(keyedBy: CodingKeys.self)
     
     if let geometry = self.geometry {
     try container.encode(geometry, forKey: .geometry)
     }
     
     if properties != nil {
     try container.encode(properties, forKey: .properties)
     }
     if propertiesArray != nil {
     try container.encode(propertiesArray, forKey: .properties)
     }
     
     }
     */
    
    
    
}
