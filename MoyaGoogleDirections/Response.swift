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
    public let maneuver: String?
    public let polyline: Polyline
    public let htmlInstructions: String?

    enum CodingKeys: String, CodingKey {
        case startLocation = "start_location"
        case endLocation = "end_location"
        case maneuver
        case polyline
        case htmlInstructions = "html_instructions"
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

public class Maneuver {
    public static let turnSlightLeft = "turn-slight-left"
    public static let turnSharpLeft = "turn-sharp-left"
    public static let uTurnLeft = "uturn-left"
    public static let turnLeft = "turn-left"
    public static let turnSlightRight = "turn-slight-right"
    public static let turnSharpRight = "turn-sharp-right"
    public static let uTurnRight = "uturn-right"
    public static let turnRight = "turn-right"
    public static let straight = "straight"
    public static let rampLeft = "ramp-left"
    public static let rampRight = "ramp-right"
    public static let merge = "merge"
    public static let forkLeft = "fork-left"
    public static let forkRight = "fork-right"
    public static let ferry = "ferry"
    public static let ferryTrain = "ferry-train"
    public static let roundaboutLeft = "roundabout-left"
    public static let roundaboutRight = "roundabout-right"
    public static let keepLeft = "keep-left"
    public static let keepRight = "keep-right"
}
