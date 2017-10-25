//
//  Copyright © 2017 Beeline. All rights reserved.
//

public struct Response: Codable {
    public let routes: [Route]
}

public struct Route: Codable {
    public let legs: [Leg]
}

public struct Leg: Codable {
    public let steps: [Step]
}

public struct Step: Codable {
    public let polyline: Polyline
}

public struct Polyline: Codable {
    public let points: String
}
