import Foundation
import MapKit

public struct LocationPickerData: Identifiable {
    public var id: UUID = .init()
    public var address: String = ""
    public var street: String = ""
    public var city: String = ""
    public var country: String = ""
    public var coordinate: CLLocationCoordinate2D?
}

extension LocationPickerData: Equatable {
    public static func == (lhs: LocationPickerData, rhs: LocationPickerData) -> Bool {
        return lhs.city == rhs.city &&
        lhs.country == rhs.country &&
        lhs.coordinate?.latitude == rhs.coordinate?.latitude
    }
}

extension LocationPickerData {
    public var title: String {
        var street = self.street
        if
            street.filter({!$0.isWhitespace}).count == .zero,
            address.isEmpty == false
        {
            street = address
        }
        return [street, city, country]
            .compactMap {
                $0.isEmpty ? nil : $0
            }
            .joined(separator: ", ")
    }
}
