//
//  Position.swift
//  CodableGeoJson
//
//  Created by patrick on 20.12.17.
//

import Foundation


public struct Position: Codable {
    let latitude: Float
    let longitude: Float
    let altitude: Float?
    
    
    private enum CodingKeys : CodingKey {
        case coordinates
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let arrayOfFloats = try container.decode([Float].self)
        
        guard arrayOfFloats.count > 1 else {
            throw DecodingError.valueNotFound(Float.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Numbers are wrong!"))
        }
        
        longitude = arrayOfFloats[0]
        latitude = arrayOfFloats[1]
        
        if arrayOfFloats.count > 2 {
            altitude = arrayOfFloats[3]
        } else {
            altitude = nil
        }
        
        
        
        
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        var tempArray = [longitude, latitude]
        if altitude != nil {
            tempArray.append(altitude!)
        }
        try container.encode(tempArray)
    }
}





