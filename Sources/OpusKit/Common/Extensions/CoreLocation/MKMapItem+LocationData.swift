import MapKit

public extension MKMapItem {
    var locationData: LocationData {
        let placemark = self.placemark
        return LocationData(
            id: UUID(),
            address: placemark.name ?? "",
            street: "\(placemark.thoroughfare ?? "") \(placemark.subThoroughfare ?? "")",
            city: placemark.locality ?? "",
            country: placemark.country ?? "",
            coordinate: placemark.location?.coordinate
        )
    }
}
