import Foundation



public enum GeoJSONType : String, Decodable {
    
    // be careful not to rename these – the encoding/decoding relies on the string
    // values of the cases. If you want the decoding to be reliant on case
    // position rather than name, then you can change to enum TagType : Int.
    // (the advantage of the String rawValue is that the JSON is more readable)
    case featureCollection = "FeatureCollection", feature = "Feature", point = "Point", polygon = "Polygon"
    
    // to be implemented: LineString, MultiPoint, Polygon, MultiLineString, MultiPolygon, GeometryCollection
    
    var metatype: GeoJSON.Type {
        switch self {
        case .featureCollection:
            return FeatureCollection.self
        case .feature:
            return Feature.self
        case .point:
            return Point.self
        case .polygon:
            return Polygon.self
        }
    }
}


public protocol GeoJSON: Decodable {
    static var type: GeoJSONType {
        get
    }
}


public struct AnyGeoJSON : Decodable {
    
    var base: GeoJSON
    
    public init(_ base: GeoJSON) {
        self.base = base
    }
    
    private enum CodingKeys : CodingKey {
        case type, base
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(GeoJSONType.self, forKey: .type)
        self.base = try type.metatype.init(from: decoder)
    }
    
    /*
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type(of: base).type, forKey: .type)
        try base.encode(to: encoder)
    }
    */
}


// Mark: Coding Extentions

// Allow the coding of JSON objects with any

struct JSONCodingKeys: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
}

extension KeyedDecodingContainer {
    
    func decode(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any> {
        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any>? {
        guard contains(key) else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    func decode(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any> {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any>? {
        guard contains(key) else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        var dictionary = Dictionary<String, Any>()
        
        for key in allKeys {
            if let boolValue = try? decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = boolValue
            } else if let stringValue = try? decode(String.self, forKey: key) {
                dictionary[key.stringValue] = stringValue
            } else if let intValue = try? decode(Int.self, forKey: key) {
                dictionary[key.stringValue] = intValue
            } else if let doubleValue = try? decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = doubleValue
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedDictionary
            } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedArray
            } else if try decodeNil(forKey: key) {
                dictionary[key.stringValue] = nil
            }
        }
        return dictionary
    }
}

extension UnkeyedDecodingContainer {
    
    mutating func decode(_ type: Array<Any>.Type) throws -> Array<Any> {
        var array: [Any] = []
        while isAtEnd == false {
            if let value = try? decode(Bool.self) {
                array.append(value)
            } else if let value = try? decode(Double.self) {
                array.append(value)
            } else if let value = try? decode(String.self) {
                array.append(value)
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self) {
                array.append(nestedDictionary)
            } else if let nestedArray = try? decode(Array<Any>.self) {
                array.append(nestedArray)
            }
        }
        return array
    }
    
    mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        
        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
        return try nestedContainer.decode(type)
    }
}


