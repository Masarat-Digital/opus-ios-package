import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    public func locationData() async -> LocationData? {
        let coordinate = self
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        do {
            let placemarks = try await geoCoder.reverseGeocodeLocation(location)
            guard let placeMark = placemarks.first else { return nil }
            let location = LocationData(
                address: placeMark.name ?? "",
                street: "\(placeMark.thoroughfare ?? "") \(placeMark.subThoroughfare ?? "")",
                city: placeMark.locality ?? placeMark.administrativeArea ?? "",
                country: placeMark.country ?? "",
                coordinate: self
            )
            return location
        } catch {
            return nil
        }
    }
}
