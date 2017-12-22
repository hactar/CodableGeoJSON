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
}


