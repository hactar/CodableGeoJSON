//
//  Position.swift
//  CodableGeoJson
//
//  Created by patrick on 20.12.17.
//

import Foundation


public struct Position: Codable {
    public let latitude: Float
    public let longitude: Float
    public let altitude: Float?
    
    public init(latitude: Float, longitude: Float, altitude: Float?) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
    }
    
    
    private enum CodingKeys : CodingKey {
        case coordinates
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let arrayOfFloats = try container.decode([Float].self)
        
        guard arrayOfFloats.count > 1 else {
            throw DecodingError.valueNotFound(Float.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Incorrect number of values in position array"))
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
        
        var tempArray = [Decimal(string: longitude.description)!, Decimal(string: latitude.description)!]
        if altitude != nil {
            tempArray.append(Decimal(string: altitude!.description)!)
        }
        try container.encode(tempArray)
    }
}





