# CodableGeoJson

This is a pure swift 4 implementation of GeoJSON, using Decodable. It is incomplete as I only require parts of the GeoJSON spec, but could be expanded.

## Installation

Use Swift Package Manager.

## Usage

```
let geoJSON =  try JSONDecoder().decode(AnyGeoJSON.self, from: libaries())
print(geoJSON)
```

## License

Public Domain
