//
//  Copyright © 2017 Beeline. All rights reserved.
//
import CoreLocation

public struct Response: Decodable {
    public let routes: [Route]
}

public struct Route: Decodable {
    public let legs: [Leg]
    public let overviewPolyline: Polyline

    enum CodingKeys: String, CodingKey {
        case legs
        case overviewPolyline = "overview_polyline"
    }
}

public struct Leg: Decodable {
    public let steps: [Step]
}

public struct Step: Decodable {
    public let startLocation: Location
    public let endLocation: Location
    public let polyline: Polyline

    enum CodingKeys: String, CodingKey {
        case startLocation = "start_location"
        case endLocation = "end_location"
        case polyline
    }
}

public struct Polyline: Decodable {
    public let points: String
}

public struct Location: Decodable {
    public let latitude: CLLocationDegrees
    public let longitude: CLLocationDegrees

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }

    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
