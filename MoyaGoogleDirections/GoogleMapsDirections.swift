//
//  Copyright © 2017 Beeline. All rights reserved.
//

import Moya
import Alamofire
import CoreLocation

public enum Mode {
    case walking, driving, bicycling, transit
}

public enum GoogleMapsDirections {
    case directions(key: String, origin: CLLocationCoordinate2D, waypoints: [CLLocationCoordinate2D], destination: CLLocationCoordinate2D, mode: Mode)
}

extension GoogleMapsDirections: TargetType {

    public var baseURL: URL {
        return URL(string: "https://maps.googleapis.com/maps/api/directions/")!
    }

    public var path: String {
        switch self {
        case .directions: return "json"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        switch self {
        case let .directions(key, origin, waypoints, destination, mode):
            var params = [String : Any]()
            params["key"] = key
            params["origin"] = origin.latLngString
            params["destination"] = destination.latLngString
            params["mode"] = String(describing: mode)
            if !waypoints.isEmpty {
                params["waypoints"] = waypoints.map { $0.latLngString } .joined(separator: "|")
            }
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    public var headers: [String : String]? {
        return nil
    }

    public var sampleData: Data {
        return "".data(using: .utf8)!
    }
}

extension CLLocationCoordinate2D {

    var latLngString: String {
        return "\(latitude),\(longitude)"
    }
}
