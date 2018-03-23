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
        var latitudeSum: Float = 0.0
        var longitudeSum: Float = 0.0
        var latitudeLast: Float = -1.0
        var longitudeLast: Float = -1.0
        var usedCoords = 0
        var ignoredCoords = 0
        self.coordinates.first!.forEach { (position) in

            
            let distanceLat = abs(latitudeLast-position.latitude)
            let distanceLong = abs(longitudeLast-position.longitude)
            let roughDistance = distanceLat + distanceLong
            //print("Rough distance is: \(roughDistance)")
            
            if roughDistance > 0.005 {
                latitudeSum = latitudeSum + position.latitude
                longitudeSum = longitudeSum + position.longitude
                latitudeLast = position.latitude
                longitudeLast = position.longitude
                usedCoords = usedCoords + 1
            } else {
                ignoredCoords = ignoredCoords + 1
            }

        }
        print("ignored coords: \(ignoredCoords)")
        return Position(latitude: latitudeSum / Float(usedCoords), longitude: longitudeSum / Float(usedCoords), altitude: nil)
        
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
