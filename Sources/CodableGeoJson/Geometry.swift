//
//  Geometry.swift
//  CodableGeoJson
//
//  Created by patrick on 20.12.17.
//

import Foundation


public struct Point: GeoJSON {
    public static var type = GeoJSONType.point
    public let coordinates: Position
}
