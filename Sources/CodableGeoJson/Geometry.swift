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
    /// Array of array of positions. The first subArray is the outer ring, any other arrays are cut outs.
    public let coordinates: [[Position]]
    
    public func centerOfGeometry() -> Position {
        var latitude: Float = 0.0
        var longitude: Float = 0.0
        self.coordinates.first!.forEach { (position) in
            latitude = latitude + position.latitude
            longitude = longitude + position.longitude
        }
        let numObjects =  Float(self.coordinates.first!.count)
        return Position(latitude: latitude / numObjects, longitude: longitude / numObjects, altitude: nil)
        
    }
    
    public init(coordinates: [[Position]]) {
        self.coordinates = coordinates
    }
}

public struct MultiPolygon: GeoJSON {
    public static var type = GeoJSONType.multiPolygon
    /// Array of array of array of positions. The first subArray  the array of polygons.
    public let coordinates: [[[Position]]]
}

public struct LineString: GeoJSON {
    public static var type = GeoJSONType.lineString
    /// Array of array of positions. The first subArray is the outer ring, any other arrays are cut outs.
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
    
    public init(coordinates: [Position]) {
        self.coordinates = coordinates
    }
}

public struct MultiLineString: GeoJSON {
    public static var type = GeoJSONType.multiLineString
    /// Array of array of positions. The first subArray is the outer ring, any other arrays are cut outs.
    public let coordinates: [[Position]]
}
