import CoreLocation

public class UserLocationService: NSObject {

    private var locationManager = CLLocationManager()
    private var continuation: CheckedContinuation<CLLocationCoordinate2D, Error>?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
}

// MARK: - CLLocationManagerDelegate

extension UserLocationService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            continuation?.resume(returning: location.coordinate)
            continuation = nil
        }
        locationManager.stopUpdatingLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation?.resume(throwing: error)
        continuation = nil
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - UserLocationServiceProtocol

extension UserLocationService: UserLocationServiceProtocol {
    public func requestLocation() async throws -> CLLocationCoordinate2D? {
        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
    }
}
