import XCTest
import Foundation
@testable import CodableGeoJson

class CodableGeoJsonTests: XCTestCase {
    
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        do {
            let geoJSON =  try JSONDecoder().decode(AnyGeoJSON.self, from: libaries())
            print(geoJSON)
            
            //let data = try JSONEncoder().encode(geoJSON)
            //print(String(data: data, encoding: .utf8)!)
            
        } catch {
            XCTAssertTrue(false)
        }
        
       
    }
    
    


    static var allTests = [
        ("testExample", testExample),
    ]
    
    
    
    
    
    func libaries() -> Data {
        
        let json = """
{"type":"FeatureCollection","totalFeatures":7,"features":[{"type":"Feature","id":"BUECHEREIOGD.308694","geometry":{"type":"Point","coordinates":[16.337296778791995,48.202305224234586]},"geometry_name":"SHAPE","properties":{"NAME":"Hauptbücherei am Gürtel","ADRESSE":"7., Urban-Loritz-Platz 2a","OEFFNUNGSZEITEN1":"Mo 11.00 bis 19.00 Uhr","OEFFNUNGSZEITEN2":"Di 11.00 bis 19.00 Uhr","OEFFNUNGSZEITEN3":"Mi 11.00 bis 19.00 Uhr","OEFFNUNGSZEITEN4":"Do 11.00 bis 19.00 Uhr","OEFFNUNGSZEITEN5":"Fr 11.00 bis 19.00 Uhr","OEFFNUNGSZEITEN6":"Sa 11.00 bis 17.00 Uhr","TELEFON":"01 4000-84 500","EMAIL":"amguertel@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/urbanloritzplatz","BEZIRK":7,"SE_SDO_ROWID":308694,"SE_ANNO_CAD_DATA":null}},{"type":"Feature","id":"BUECHEREIOGD.308695","geometry":{"type":"Point","coordinates":[16.356749375729592,48.22504838229196]},"geometry_name":"SHAPE","properties":{"NAME":"Bücherei Alsergrund","ADRESSE":"9., Alserbachstraße 11","OEFFNUNGSZEITEN1":"Mo 10.00 bis 12.00 Uhr und 14.00 bis 19.00 Uhr","OEFFNUNGSZEITEN2":"Di 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN3":"Do 10.00 bis 12.00 Uhr und 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN4":"Fr 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN5":null,"OEFFNUNGSZEITEN6":null,"TELEFON":"01 4000-09161, 0676 8118 63813","EMAIL":"alsergrund@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/simondenkgasse","BEZIRK":9,"SE_SDO_ROWID":308695,"SE_ANNO_CAD_DATA":null}},{"type":"Feature","id":"BUECHEREIOGD.308712","geometry":{"type":"Point","coordinates":[16.319342423795,48.211229117749646]},"geometry_name":"SHAPE","properties":{"NAME":"Bücherei Ottakring","ADRESSE":"16., Schuhmeierplatz 17","OEFFNUNGSZEITEN1":"Mo 10.00 bis 12.00 Uhr und 14.00 bis 19.00 Uhr","OEFFNUNGSZEITEN2":"Fr 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN3":"<Null>","OEFFNUNGSZEITEN4":"<Null>","OEFFNUNGSZEITEN5":null,"OEFFNUNGSZEITEN6":null,"TELEFON":"01 4000-16165, 0676 8118 63836","EMAIL":"ottakring@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/schuhmeierplatz","BEZIRK":16,"SE_SDO_ROWID":308712,"SE_ANNO_CAD_DATA":null}},{"type":"Feature","id":"BUECHEREIOGD.308713","geometry":{"type":"Point","coordinates":[16.306006384443684,48.22172853346725]},"geometry_name":"SHAPE","properties":{"NAME":"Bücherei Sandleiten","ADRESSE":"16., Rosa-Luxemburggasse 4","OEFFNUNGSZEITEN1":"Mo 10.00 bis 12.00 Uhr und 14.00 bis 19.00 Uhr","OEFFNUNGSZEITEN2":"Di 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN3":"Do 10.00 bis 12.00 Uhr und 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN4":"Fr 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN5":null,"OEFFNUNGSZEITEN6":null,"TELEFON":"01 4000-16161, 0676 8118 63835","EMAIL":"sandleiten@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/rosaluxemburggasse","BEZIRK":16,"SE_SDO_ROWID":308713,"SE_ANNO_CAD_DATA":null}},{"type":"Feature","id":"BUECHEREIOGD.308714","geometry":{"type":"Point","coordinates":[16.33112398785879,48.218731336523824]},"geometry_name":"SHAPE","properties":{"NAME":"Bücherei Hernals","ADRESSE":"17., Hormayrgasse 2","OEFFNUNGSZEITEN1":"Mo 10.00 bis 12.00 Uhr und 13.00 bis 19.00 Uhr","OEFFNUNGSZEITEN2":"Di 13.00 bis 18.00 Uhr","OEFFNUNGSZEITEN3":"Do 10.00 bis 12.00 Uhr und 13.00 bis 18.00 Uhr","OEFFNUNGSZEITEN4":"Fr 13.00 bis 18.00 Uhr","OEFFNUNGSZEITEN5":null,"OEFFNUNGSZEITEN6":null,"TELEFON":"01 4000-17162, 0676 8118 63839","EMAIL":"hernals@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/hormayrgasse","BEZIRK":17,"SE_SDO_ROWID":308714,"SE_ANNO_CAD_DATA":null}},{"type":"Feature","id":"BUECHEREIOGD.308715","geometry":{"type":"Point","coordinates":[16.340511920174183,48.226121210637395]},"geometry_name":"SHAPE","properties":{"NAME":"Bücherei Weimarer Straße","ADRESSE":"18., Weimarer Straße 8","OEFFNUNGSZEITEN1":"Mo 10.00 bis 12.00Uhr und 13.45 bis 19.00 Uhr","OEFFNUNGSZEITEN2":"Di 13.45 bis 18.00 Uhr","OEFFNUNGSZEITEN3":"Do 10.00 bis 12.00 Uhr 13.45 bis 18.00 Uhr","OEFFNUNGSZEITEN4":"Fr 13.45 bis 18.00 Uhr","OEFFNUNGSZEITEN5":null,"OEFFNUNGSZEITEN6":null,"TELEFON":"01 4000-18161, 0676 8118 63841","EMAIL":"weimarerstrasse@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/weimarerstrasse","BEZIRK":18,"SE_SDO_ROWID":308715,"SE_ANNO_CAD_DATA":null}},{"type":"Feature","id":"BUECHEREIOGD.308716","geometry":{"type":"Point","coordinates":[16.349394688616787,48.238233382289046]},"geometry_name":"SHAPE","properties":{"NAME":"Bücherei Billrothstraße","ADRESSE":"19., Billrothstraße 32","OEFFNUNGSZEITEN1":"Mo 11.00 bis 19.00 Uhr; Kinderbücherei 11.00 bis 18.00 Uhr","OEFFNUNGSZEITEN2":"Di 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN3":"Mi 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN4":"Do 14.00 bis 18.00 Uhr","OEFFNUNGSZEITEN5":"Fr 11.00 bis 18.00 Uhr","OEFFNUNGSZEITEN6":null,"TELEFON":"01 4000-19162, 0676 8118 63853","EMAIL":"billrothstrasse@buechereien.wien.at","WEBLINK1":"http://www.buechereien.wien.at/de/standorteoeffnungszeiten/zweigstellen/billrothstrasse","BEZIRK":19,"SE_SDO_ROWID":308716,"SE_ANNO_CAD_DATA":null}}],"crs":{"type":"name","properties":{"name":"urn:ogc:def:crs:EPSG::4326"}}}
"""
        return json.data(using: .utf8)!
    }
}
