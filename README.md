# CodableGeoJson

This is a pure swift 4 implementation of GeoJSON, using Decodable. It is working but incomplete as I only require parts of the GeoJSON spec, but could be expanded.

Implemented: FeatureCollection, Feature, Point, Position, Polygon, MultiPolygon, LineString, MultiLineString

Missing: MultiPoint, GeometryCollection. Properties are Decodable, but are currently not Codeable.

## Installation

Use Swift Package Manager.

## Usage

```
let geoJSON =  try JSONDecoder().decode(AnyGeoJSON.self, from: libaries())
print(geoJSON)
```
