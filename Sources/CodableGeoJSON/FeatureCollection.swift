//
//  GeoJSON.swift
//  CodableGeoJson
//
//  Created by patrick on 19.12.17.
//

import Foundation


public struct FeatureCollection: GeoJSON {
    public static var type = GeoJSONType.featureCollection
    public let features: [Feature]
    
    public init(features: [Feature]) {
        self.features = features
    }
    
    
    public enum CodingKeys : CodingKey {
        case type, features
    }
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.features  = try container.decode([Feature].self, forKey: .features)

        
    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(FeatureCollection.type, forKey: .type)

        try container.encode(features, forKey: .features)



    }
}


