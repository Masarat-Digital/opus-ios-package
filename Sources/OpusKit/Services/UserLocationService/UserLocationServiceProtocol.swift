import CoreLocation

public protocol UserLocationServiceProtocol: NSObject, CLLocationManagerDelegate {
    func requestLocation() async throws -> CLLocationCoordinate2D?
}
