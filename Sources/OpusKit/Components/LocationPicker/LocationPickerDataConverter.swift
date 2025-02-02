import MapKit

public enum LocationPickerDataConverter {}

extension LocationPickerDataConverter {
    public static func convert(_ info: MKMapItem) -> LocationPickerData {
        let placemark = info.placemark
        return LocationPickerData(
            address: placemark.name ?? "",
            street: "\(placemark.thoroughfare ?? "") \(placemark.subThoroughfare ?? "")",
            city: placemark.locality ?? "",
            country: placemark.country ?? "",
            coordinate: placemark.location?.coordinate
        )
    }
}
