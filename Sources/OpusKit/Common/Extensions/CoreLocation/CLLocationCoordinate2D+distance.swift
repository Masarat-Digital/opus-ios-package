import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    public func distance(to: CLLocationCoordinate2D) -> CLLocationDistance {
        let from = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return from.distance(from: to)
    }

    public func distanceKm(to: CLLocationCoordinate2D) -> Double {
        let from = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return from.distance(from: to).inKilometers()
    }
}
