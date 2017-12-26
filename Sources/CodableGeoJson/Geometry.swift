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

public struct Polygon: GeoJSON {
    public static var type = GeoJSONType.polygon
    public let coordinates: [Position]
    
    public func centerOfGeometry() -> Position {
        var latitude: Float = 0.0
        var longitude: Float = 0.0
        self.coordinates.forEach { (position) in
            latitude = latitude + position.latitude
            longitude = longitude + position.longitude
        }
        let numObjects =  Float(self.coordinates.count)
        return Position(latitude: latitude / numObjects, longitude: longitude / numObjects, altitude: nil)
        
    }
}
